class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def create
    @book = Book.new(book_params)
    @user = current_user
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: 'successfully'
    else
      flash.now[:danger] = "要件を満たしていません。"
      @books = Book.all
      render action: :index
    end
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
    @post_comment = PostComment.new
  end


  def edit
  end


  def update
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: 'successfully'
    else
      render action: :edit
    end
  end


  def destroy
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
