class BooksController < ApplicationController
	before_action :correct_user,   only: [:edit, :update, :destroy]
	def index
		@user = current_user
		@book = Book.new
		@books = Book.all
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if 
			@book.save
			flash[:notice] = "successfully" 
			redirect_to book_path(@book.id)
		else
			@user = current_user 
			@books = Book.all
			render 'index'
		end
	end

	def show
		@user = current_user
		@book = Book.new
		@books = Book.find(params[:id])
	end

	def edit
		@books = Book.find(params[:id])
	end

	def update
		@books = Book.find(params[:id])
		if
			@books.update(book_params)
			flash[:notice] = "successfully" 
			redirect_to book_path(@books.id)
		else
			render 'edit'
		end
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy 
		redirect_to books_path
	end
	
	private
	def book_params
		params.require(:book).permit(:title, :body, :user_id)
	end

	def correct_user
		book = Book.find(params[:id])
		unless current_user.id == book.user.id
			redirect_to books_path
		end
	end
end
