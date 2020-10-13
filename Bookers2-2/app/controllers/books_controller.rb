class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all.order(created_at: :desc)
  end

  def show
    @book = Book.new
    @book_show = Book.find(params[:id])

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path(@book.id), notice: "You have creatad book successfully."
    else
      render :index
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to books_path(@book.id), notice: "You have updated book successfully."
    else
      render books_path
    end
  end

  def destroy
      @book.destroy
      redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body,)
  end

  def find_book
    @book = Book.find(params[:id])
  end
end
