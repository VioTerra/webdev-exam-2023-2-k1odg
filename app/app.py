from flask import Flask, render_template, abort, send_from_directory, url_for, redirect
# импортирует класс `Flask` из модуля `flask`

from sqlalchemy import MetaData
# импортируется класс MetaData из библиотеки SQLAlchemy - это объект, который содержит информацию о базе данных SQL

from flask_sqlalchemy import SQLAlchemy
# импортируется класс SQLAlchemy из Flask SQLAlchemy  - это расширение Flask, которое предоставляет доступ к объекту базы данных SQLAlchemy в приложении Flask

from flask_migrate import Migrate
# Библиотека Flask-Migrate позволяет мигрировать базы данных в приложении Flask, используя SQLAlchemy



app = Flask(__name__)
# создает экземпляр приложения Flask, с именем текущего модуля (__name__ - это встроенная переменная, которая содержит имя текущего модуля)

application = app
# копирует объект приложения Flask в новую переменную `application`. Обычно используется, когда запускается сервер приложений, который ожидает переменную `application` в качестве имени приложения

app.config.from_pyfile('config.py')
# подклюячаем 'config.py', он содержит переменные с параметрами конфигурации, которые могут быть использованы в приложении (настройки базы данных, настройки безопасности, параметры сессии)

convention = {
    "ix": "ix_%(column_0_label)s",
    "uq": "uq_%(table_name)s_%(column_0_name)s",
    "ck": "ck_%(table_name)s_%(constraint_name)s",
    "fk": "fk_%(table_name)s_%(column_0_name)s_%(referred_table_name)s",
    "pk": "pk_%(table_name)s"
}
# Создание словаря "convention", содержащего соглашение об именовании для различных ограничений таблицы

metadata = MetaData(naming_convention=convention)
# Создание объекта "metadata" класса MetaData, принимающего словарь "convention" в качестве параметра

db = SQLAlchemy(app, metadata=metadata)
#  Создание объекта SQLAlchemy для взаимодействия с базой данных, принимающего объект "app" (Flask-приложение) и объект "metadata" в качестве параметров

migrate = Migrate(app, db)
# Создание объекта "migrate" класса Migrate для выполнения миграций в базе данных, принимающего объект "app" и объект SQLAlchemy "db" в качестве параметров

from auth import bp as auth_bp, init_login_manager
from books import bp as books_bp

app.register_blueprint(auth_bp)
app.register_blueprint(books_bp)

init_login_manager(app)

from models import Book, Genre, Image, Review, User, Role
# Чтобы flask_migrate увидел нашу модель, ее надо импортировать

from tools import BooksFilter, ImageSaver

TITLE = {
    'index': 'Статус входа'
}

@app.route('/')
def index():
    return render_template('index.html', title=TITLE["index"])


@app.route('/images/<image_id>')
def image(image_id):
    image = Image.query.get(image_id)
    if image is None:
        abort(404)
    return send_from_directory(app.config['UPLOAD_FOLDER'],
                               image.storage_filename)


