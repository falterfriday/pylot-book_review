"""
MODEL File
"""
from system.core.model import Model
import re
import bcrypt

class Book(Model):
	def __init__(self):
		super(Book, self).__init__()

	def add_book(self, book_info):
		book_query = "INSERT INTO books (title, author, created_at, updated_at) VALUES (:title, :author, NOW(), NOW() )"
		book_data = {
		'title':book_info['title'],
		'author':book_info['author']
		} 
		book_id = self.db.query_db(book_query, book_data)
		review_query = "INSERT INTO reviews (review, rating, user_id, book_id, created_at, updated_at) VALUES (:review, :rating, :user_id, :book_id, NOW(), NOW() )"
		review_data = {
		'review':book_info['review'],
		'rating':book_info['rating'],
		'user_id':book_info['user_id'],
		'book_id':book_id
		}
		review_id = self.db.query_db(review_query, review_data)
		book_page_query = "SELECT * FROM books JOIN reviews ON reviews.book_id = books.id ORDER BY reviews.created_at DESC"
		book_page_data = {'book_id':book_id}
		return self.db.query_db(book_page_query, book_page_data)
		

	def get_recent_reviews(self):
		query = "SELECT * FROM books JOIN reviews ON reviews.book_id = books.id JOIN users ON users.id = reviews.user_id ORDER BY reviews.created_at DESC LIMIT 3"
		return self.db.query_db(query)

	def get_all_books(self):
		query = "SELECT * FROM books LIMIT 20"
		return self.db.query_db(query)

	def get_book_by_id(self, info):
		query = "SELECT *, reviews.id AS review_id FROM books JOIN reviews ON reviews.book_id = books.id JOIN users ON users.id = reviews.user_id WHERE book_id = :book_id"
		data = {'book_id':info['book_id']}
		return self.db.query_db(query, data)

	def add_review(self, info):
		query = "INSERT INTO reviews (review, rating, created_at, updated_at, user_id, book_id) VALUES (:review, :rating, NOW(), NOW(), :user_id, :book_id)"
		data = {
		'review':info['review'],
		'rating':info['rating'],
		'user_id':info['user_id'],
		'book_id':info['book_id']
		}
		return self.db.query_db(query, data)

	def delete_review(self, info):
		book_query = "SELECT * FROM reviews WHERE id = :review_id"
		book_data = {'review_id':info['review_id']}
		book_info = self.db.query_db(book_query, book_data)

		query = "DELETE FROM reviews WHERE id = :review_id"
		data = {'review_id':info['review_id']}
		self.db.query_db(query, data)


		return book_info


