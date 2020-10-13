class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update]

  def index
    @book = Book.new
    @users = User.all.order(created_at: :desc)
    @user = current_user
  end

  def create
    render tenplate: 'books/create'
  end

  def show
    @books_show = @user.books
    @book = Book.new
  end

  def edit
  end

  def update
    if @user.update(params_user)
      redirect_to user_path(@user), notice: "更新に成功しました"
    else
      render 'users/edit'
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def params_user
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
