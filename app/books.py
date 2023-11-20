from flask import Blueprint, render_template, request, flash, redirect, url_for
from app import db
from models import *
from tools import BooksFilter, ImageSaver
from flask_login import current_user, login_required
from sqlalchemy import func
import markdown
import bleach

TITLE = {
    'main_page': 'Главная страница',
    'new_book': 'Добавление книги',
    'show_book': 'Данные о книге',
    'edit_book': 'Редактирование книги',
    'new_review': 'Оставить рецензию'
    # ... Другие страницы и их заголовки
}

bp = Blueprint('books', __name__, url_prefix='/books')

from auth import permission_check

PER_PAGE = 3

BOOK_PARAMS = [
    'name', 'description', 'year', 'publisher', 'author', 'volume'
]

def params():
    data = request.form
    return {key: data[key] for key in BOOK_PARAMS}

def search_params():
    return {
        'name': request.args.get('name'),
        'genre_ids': request.args.getlist('genre_ids'),
    }


@bp.route('/')
def main_page():
    page = request.args.get('page', 1, type=int)
    books = BooksFilter(**search_params()).perform()
    pagination = books.paginate(page, PER_PAGE)
    books = pagination.items
    genres = Genre.query.all()
    images = Image.query.all()

    return render_template('main_page.html',
                           title=TITLE["main_page"],
                           genres=genres,
                           books=books,
                           images=images,
                           pagination=pagination, per_page=PER_PAGE, page=page,
                           search_params=search_params())


@bp.route('/new_book')
@login_required
@permission_check('create_book')
def new_book():
    book = None
    genres = Genre.query.all()
    return render_template('books/new_book.html',
                           title=TITLE["new_book"],
                           book=book,
                           genres=genres,
                           )


@bp.route('/create_book', methods=['POST'])
@login_required
@permission_check('create_book')
def create_book():
    img = None
    f = request.files.get('background_img')
    if f and f.filename:
        img = ImageSaver(f).save()

    if img is not None:
        book = Book(**params(), cover_id=img.id)
        description = bleach.clean(request.form.get('description'))
        book.description = description
        genres = request.form.getlist('genre_id')
        genres = list(map(Genre.query.get, genres))  
        book.genres = genres

    try:
        db.session.add(book)
        db.session.commit()
    except:
        db.session.rollback()
        flash('Ошибка отправления данных. Введены некорректные данные или не все поля заполнены!', 'danger')
        return redirect(url_for('books.new_book'))


    flash(f'Книга "{book.name}" успешно добавлена.', 'success')
    return redirect(url_for('books.main_page'))


@bp.route('/book<int:book_id>')
def show_book(book_id):
    book = Book.query.get(book_id)
    book.description = markdown.markdown(book.description)

    reviews = Review.query.filter_by(book_id=book_id).order_by(Review.date_created.desc()).all()
    for review in reviews:
        review.text = markdown.markdown(review.text)

    users = User.query.all()

    image = Image.query.get(book.cover_id)

    return render_template('books/show_book.html',
                           title=TITLE["show_book"],
                           book=book,
                           reviews=reviews,
                           users=users,
                           image=image
                           )


@bp.route('/book<int:book_id>/new_review')
@login_required
def new_review(book_id):
    book = Book.query.get(book_id)
    return render_template('reviews/new_review.html',
                           title=TITLE["new_review"],
                           book=book)


@bp.route('/book<int:book_id>/add_review', methods=['POST'])
@login_required
def add_review(book_id):
    rating = int(request.form['rating'])
    text = bleach.clean(request.form.get('text'))
    book = Book.query.get(book_id)
    # Проверка, оставлял ли пользователь уже отзыв для данной книги
    existing_review = Review.query.filter_by(book_id=book_id, user_id=current_user.id).first()
    if existing_review:
        flash(f'Вы уже отправляли рецензию книги "{book.name}"!', 'danger')
        return redirect(url_for('books.show_book', book_id=book_id))

    # Создание нового отзыва
    review = Review(rating=rating, text=text, date_created=func.now(), book_id=book_id, user_id=current_user.id)
    
    if not request.form.get('text'):
            flash('Поле текста рецензии пустое. Заполните все обязательные поля!', 'danger')
            return redirect(url_for('books.new_review', book_id=book.id))

    try:
        db.session.add(review)
        db.session.commit()

        book = Book.query.get(book_id)
        book.rating_num += 1
        book.rating_sum += rating
        db.session.add(book)
        db.session.commit()
    except:
        db.session.rollback()
        flash('Ошибка отправления данных. Введены некорректные данные или не все поля заполнены!', 'danger')
        return redirect(url_for('books.show_book', book_id=book_id))

    flash('Рецензия успешно отправлена!', 'success')
    return redirect(url_for('books.show_book', book_id=book_id))


@bp.route('/book<int:book_id>/edit_book')
@login_required
@permission_check('edit_book')
def edit_book(book_id):
    book = Book.query.get(book_id)
    genres = Genre.query.all()
    images = Image.query.all()
    return render_template('books/edit_book.html',
                           title=TITLE["edit_book"],
                           book=book,
                           images=images,
                           genres=genres)


@bp.route('/book<int:book_id>/update_book', methods=['POST'])
@login_required
@permission_check('edit_book')
def update_book(book_id):
    book = Book.query.get(book_id)
    if request.method == 'POST':
        try:
            # Обновляем поля книги на основе данных из формы
            book.name = request.form.get('name')
            description = bleach.clean(request.form.get('description'))
            book.description = description
            book.year = request.form.get('year')
            book.publisher = request.form.get('publisher')
            book.author = request.form.get('author')
            book.volume = request.form.get('volume')

            # Обновляем жанры, которым принадлежит книга
            genre_ids = request.form.getlist('genre_id')
            book.genres = Genre.query.filter(Genre.id.in_(genre_ids)).all()

            # Проверка заполнены ли все поля
            if not all(request.form.get(field) for field in ['name', 'description', 'year', 'publisher', 'author', 'volume', 'genre_id']):
                flash('Заполните все обязательные поля!', 'danger')
                return redirect(url_for('books.edit_book', book_id=book_id))

            # Сохраняем изменения в базе данных
            db.session.commit()
            flash(f'Изменения книги "{book.name}" успешно сохранены.', 'success')
            return redirect(url_for('books.main_page', book_id=book_id))
        except:
            db.session.rollback() # Откатываем изменения при возникновении ошибки
            flash('Ошибка при сохранении изменений. Проверьте корректность введенных данных!', 'danger')
            return redirect(url_for('books.edit_book', book_id=book_id))


@bp.route('/book<int:book_id>/delete_book', methods=['POST'])
@login_required
@permission_check('delete_book')
def delete_book(book_id):
    book = Book.query.get(book_id)
    image = Image.query.get(book.cover_id)
    reviews = Review.query.filter_by(book_id=book_id).all()

    try:
        db.session.delete(book)
        if image:
            db.session.delete(image)
        for review in reviews:
            db.session.delete(review)
        db.session.commit()
    except:
        db.session.rollback()
        flash('Ошибка удаления данных!', 'danger')
        return redirect(url_for('books.main_page'))

    flash(f'Книга "{book.name}" успешно удалена.', 'success')
    return redirect(url_for('books.main_page'))