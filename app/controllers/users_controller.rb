class UsersController < ApplicationController
before_action :authenticate_user!
before_action :correct_user, only: [:edit, :update]

  def index
  	@book = Book.new
  	@users = User.all
    @user = current_user
  end

  def show
  	@book = Book.new
    @user = User.find(params[:id])
    @books = current_user.books.all
  end

  def create
  	@book = Book.new
  	if @book.save
  	redirect_to user_path(@book.id), :notice => 'You have creatad book successfully.'
    else
      render template: "book/index"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path, :notice => 'You have updated user successfully.'
    else
    render action: :edit
    end
  end



private

  def book_params
  	params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
    user = User.find(params[:id])
    if current_user != user
    redirect_to user_path(current_user)
  end
  end
end
