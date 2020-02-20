class BooksController < ApplicationController
before_action :authenticate_user!

	def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    @users = User.all
	end

	def show
    @books = Book.find(params[:id])
    @book = Book.new
	end

	def create
  	@book = Book.new(book_params)
    @book.user_id =current_user.id
  	if @book.save
  	redirect_to user_path(current_user), :notice => 'You have creatad book successfully.'
    else
      @user = current_user
      @books = Book.all
      render action: :index
  end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to user_path(current_user), :notice => 'You have updated user successfully.'
  end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


private

  def book_params
  	params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
