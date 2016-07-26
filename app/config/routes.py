"""
    Routes Configuration File
"""

from system.core.router import routes


routes['default_controller'] = 'Users'
routes['POST']['/register'] = 'Users#add_user'
routes['POST']['/login'] = 'Users#login_user'
routes['/clear'] = 'Users#clear'
routes['/books'] = 'Books#index'
routes['/books/add'] = 'Books#add_page'
routes['POST']['/books/add_book'] = 'Books#add_book'
routes['/users/<user_id>'] = 'Users#get_user_from_id'
routes['/books/<book_id>'] = 'Books#book'
routes['POST']['/add_review/<book_id>'] = 'Books#add_review'
routes['/delete/<review_id>'] = 'Books#delete_review'
