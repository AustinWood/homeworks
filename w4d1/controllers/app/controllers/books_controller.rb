class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    # your code here
  end

  def create
    # your code here
  end

  def destroy
    Book.find(params["id"]).destroy
    redirect_to "index"
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
