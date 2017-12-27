class BooksController < ApplicationController
  before_action :set_book, only: [:show,:edit,:update,:destroy]
  def index
    @books = Book.paginate(page: params[:page], per_page: 6)
  end
  def show
    @file_path = @book.file.url
  end
  def new
    @book = Book.new
  end
  def create
    @book = Book.new(book_params)
    if(@book.save)
      redirect_to @book, success: 'Книга успешно создана'
    else
      render :new,danger: 'Книга не создана'
    end
  end

  def edit

  end

  def update

    if @book.update_attributes(book_params)
      redirect_to @book, success: 'Книга успешно обновлена'
    else
      render :edit, danger: 'Книга не обновлена'
    end
  end
  def destroy
    @book.destroy
    redirect_to books_path, success: 'Книга успешно удалена'
  end



  private
  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :file, :body,:image)
  end
end
