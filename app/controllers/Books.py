"""
CONTROLLER File
"""
from system.core.controller import *

class Books(Controller):
	def __init__(self, action):
		super(Books, self).__init__(action)

		self.load_model('User')
		self.load_model('Book')
		self.db = self._app.db

	def index(self):
		if session == {}:
			return redirect('/')
		else:
			print '$'*80
			print 'Your session:', session
			print '$'*80
			books_and_reviews = self.models['Book'].get_recent_reviews()
			books = self.models['Book'].get_all_books()
			return self.load_view('books.html', books_and_reviews=books_and_reviews, alias=session['alias'], books=books)

	def add_page(self):
		return self.load_view('add_book.html')

	def add_book(self):
		if session == {}:
			return redirect('/')
		else:
			book_info = {
			'title': request.form['title'],
			'author' : request.form['author'],
			'review' : request.form['review'],
			'rating' : request.form['rating'],
			'user_id': session['id']
			}
			added_book = self.models['Book'].add_book(book_info)
			print "&$^"*80
			print added_book
			book_id = added_book[0]['book_id']
			return redirect('/books/'+str(book_id))

	



	def book(self, book_id):
		info = {'book_id':book_id}
		books = self.models['Book'].get_book_by_id(info)
		if books[0]['book_id'] == None:
			info =  {'title' : books[0]['title']}
			self.models['Book'].delete_book(info)
			return redirect('/books')
		else:
			print "&$^"*80
			print books
			return self.load_view('book_info.html', books=books)

	




	def add_review(self, book_id):
		if session == {}:
			return redirect('/')
		else:
			info = {
			'book_id':book_id,
			'review':request.form['review'],
			'rating':request.form['rating'],
			'user_id':session['id']
			}
			self.models['Book'].add_review(info)
			return redirect('books/'+str(book_id))

	def delete_review(self, review_id):
		if session == {}:
			return redirect('/')
		else:
			info = {'review_id':review_id}
			query = self.models['Book'].delete_review(info)
			print "$%"*60
			print query
			book_id = query[0]['book_id']
			return redirect('/books/'+str(book_id))

