class BooksController < ApplicationController
	def index
		@user = current_user
		@book = Book.new(book_params)
		@book.save
		redirect_to '/books'
		@books = Book.all
	end

	def create
		book = Book.new(book_params)
		book.save
		redirect_to user_path(current_user)
	end
	
	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
