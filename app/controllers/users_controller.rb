class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end

  def index
  @user = current_user
  @new_book = Book.new
  @users = User.all
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
    params.require(:user).permit(:image)
  end
end