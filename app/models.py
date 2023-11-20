import os

import sqlalchemy as sa
# импортируется библиотека SQLAlchemy под псевдонимом sa

from users_policy import UsersPolicy

from werkzeug.security import check_password_hash, generate_password_hash

from flask_login import UserMixin

from flask import url_for, current_app

from app import db
# импортируется объект db из модуля app


class Book(db.Model):
    __tablename__ = 'books'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    description = db.Column(db.Text, nullable=False)
    year = db.Column(db.String(4), nullable=False)
    publisher = db.Column(db.String(100), nullable=False)
    author = db.Column(db.String(100), nullable=False)
    volume = db.Column(db.Integer, nullable=False)
    cover_id = db.Column(db.String(100), db.ForeignKey('images.id', ondelete='CASCADE'))

    rating_sum = db.Column(db.Integer, nullable=False, default=0)
    rating_num = db.Column(db.Integer, nullable=False, default=0)

    genres = db.relationship('Genre', secondary='books_genres', backref='books')
    reviews = db.relationship('Review', backref='book')

    def __repr__(self):
        return '<Book %r>' % self.name
    
    @property
    def rating(self):
        approved_reviews = Review.query.filter_by(status_id=2, book_id=self.id).all()
        if len(approved_reviews) > 0:
            rating_sum = sum(review.rating for review in approved_reviews)
            return rating_sum / len(approved_reviews)
        return 0
    
    @property
    def approved_reviews(self):
        return [review for review in self.reviews if review.status_id == 2]


class Genre(db.Model):
    __tablename__ = 'genres'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False, unique=True)

    def __repr__(self):
        return '<Genre %r>' % self.name


# Связующая таблица
class BookGenre(db.Model):
    __tablename__ = 'books_genres'

    book_id = db.Column(db.Integer, db.ForeignKey('books.id', ondelete='CASCADE'), primary_key=True)
    genre_id = db.Column(db.Integer, db.ForeignKey('genres.id', ondelete='CASCADE'), primary_key=True)

    book = db.relationship('Book')
    genre = db.relationship('Genre')

    def __repr__(self):
        return '<BookGenre book_id=%r genre_id=%r>' % (self.book_id, self.genre_id)


class Image(db.Model):
    __tablename__ = 'images'

    id = db.Column(db.String(100), primary_key=True)
    file_name = db.Column(db.String(100), nullable=False)
    mime_type = db.Column(db.String(100), nullable=False)
    md5_hash = db.Column(db.String(100), nullable=False, unique=True)

    book = db.relationship('Book', uselist=False, backref='cover')

    @property
    def storage_filename(self):
        _, ext = os.path.splitext(self.file_name)
        return str(self.id) + ext

    @property
    def url(self):
        return url_for('image', image_id=self.id)

    def __repr__(self):
        return '<Image %r>' % self.file_name


class ReviewStatus(db.Model):
    __tablename__ = 'review_statuses'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False, unique=True)

    def __repr__(self):
        return '<ReviewStatus %r>' % self.name


class Review(db.Model):
    __tablename__ = 'reviews'

    id = db.Column(db.Integer, primary_key=True)
    book_id = db.Column(db.Integer, db.ForeignKey('books.id', ondelete='CASCADE'), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id', ondelete='CASCADE'), nullable=False)
    rating = db.Column(db.Integer, nullable=False)
    text = db.Column(db.Text, nullable=False)
    date_created = db.Column(db.DateTime, nullable=False, server_default=sa.sql.func.now())
    status_id = db.Column(db.Integer, db.ForeignKey('review_statuses.id', ondelete='CASCADE'), nullable=False, default=1)

    user = db.relationship('User', backref='reviews')
    status = db.relationship('ReviewStatus', backref='reviews', lazy=True)

    def __repr__(self):
        return f'<Review {self.id}>'


class User(db.Model, UserMixin):
    __tablename__ = 'users'

    id = db.Column(db.Integer, primary_key=True)
    login = db.Column(db.String(100), unique=True, nullable=False)
    password_hash = db.Column(db.String(200), nullable=False)
    last_name = db.Column(db.String(100), nullable=False)
    first_name = db.Column(db.String(100), nullable=False)
    middle_name = db.Column(db.String(100))
    role_id = db.Column(db.Integer, db.ForeignKey('roles.id'), nullable=False)

    def set_password(self, password):
        self.password_hash = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password_hash, password)

    def __init__(self, user_id, user_login, role_id):
        self.id = user_id
        self.login = user_login
        self.role_id = role_id
        
	# Возвращает тру, если пользователь админ, и фолс, если нет
    def is_admin(self):
        # Сравнивается Id роли с админским
        return self.role_id == current_app.config['ADMINISTRATOR_ROLE_ID']
    
    # Возвращает тру, если пользователь модер, и фолс, если нет
    def is_moderator(self):
        # Сравнивается Id роли с модером
        return self.role_id == current_app.config['MODERATOR_ROLE_ID']

	# Метод, отвечающий за проверку прав
	# Метод `can` создает экземпляр класса `UsersPolicy` с переданной записью и подгружает
	#  метод `action` этого класса, который отвечает за проверку полномочий пользователя на
	#  выполнение данного действия. Если метод найден, то он вызывается и возвращается его
	#  результат. Если метод не найден, то возвращается `False`.
    def can(self, action, record = None):
        users_policy = UsersPolicy(record)
        method = getattr(users_policy, action, None)
        if method:
            return method()
        return False

    @property
    def full_name(self):
        return ' '.join([self.last_name, self.first_name, self.middle_name or ''])

    def __repr__(self):
        return '<User %r>' % self.login


class Role(db.Model):
    __tablename__ = 'roles'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False, unique=True)
    desc = db.Column(db.Text, nullable=False)

    users = db.relationship('User', backref='role')

    def __repr__(self):
        return '<Role %r>' % self.name
