class BooksController < ApplicationController
	def index
		@user = current_user
		@book = Book.new(book_params)
		@book.save
		redirect_to '/books'
		@books = Book.all
	end
	
	private
    def book_params
    params.permit(:title, :body)
    end
end
