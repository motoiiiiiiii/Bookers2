class UsersController < ApplicationController
	before_action :correct_user,   only: [:edit, :update, :destroy]
	def home
		
	end

	def index
		@user = current_user
		@users = User.all
		@book = Book.new
	end

	def show
		@user = current_user
		@user1 = User.find(params[:id])
		@books = @user.books
		@book = Book.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
		   flash[:notice] = "successfully" 
		   redirect_to user_path(@user.id)
		else
			# @user = User.find(params[:id])
			render 'edit'
		end
	end

	private	  
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end

	def correct_user
		user = User.find(params[:id])
		unless current_user.id == user.id
			redirect_to user_path(current_user)
		end
	end
end
