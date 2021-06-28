class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = User.all
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
  @user = current_user
  @users = User.all
  @book = Book.new
  @books = Book.all
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def create
     @book = Book.new(book_params)
    if @book.save
    redirect_to book_path(@book.id)
    flash[:notice] = 'Book was successfully created.'
    else
    @books = Book.all
    render :index
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:image, :name, :profile_image, :introduction)
  end
  def book_params
    params.require(:book).permit(:title, :body)
  end
end