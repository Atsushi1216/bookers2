class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(current_user), notice: 'successfully'
    else
    render action: :edit
    end
  end

  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_url(@model, @content, @method)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def ensure_correct_user
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

end
