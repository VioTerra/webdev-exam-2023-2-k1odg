from faker import Faker
import random
from models import Genre, Book
from app import db

fake = Faker()

genres_list = [
    'Фантастика', 'Детектив', 'Роман', 'Классика', 'Приключения'
]

def book_data_upgrades(num_books):
    for _ in range(num_books):
        
        book_genres = []
        num_genres = 1
        
        num_genres_rule = [2, 3, 4, 5, 6]
        probability_rule = [1, 0.7, 0.5, 0.3, 0.1]
        if random.choice([True, False]):
            num_genres = random.choices(num_genres_rule, probability_rule, k=1)[0]
            
        for i in range(num_genres):
            genre = random.choice(genres_list)
            g = Genre.query.filter_by(name=genre).first()
            if g not in book_genres:
                book_genres.append(g)
                
        book = Book(
            name=fake.sentence(nb_words=5).replace(".", ""),
            description=fake.text(max_nb_chars=1000),
            year = str(fake.random_int(min=1900, max=2023)),
            publisher=fake.company(),
            author=fake.name(),
            volume=random.randint(100, 1500),
            rating_sum=0,
            rating_num=0,
            genres=book_genres
        )

        db.session.add(book)
    db.session.commit()
