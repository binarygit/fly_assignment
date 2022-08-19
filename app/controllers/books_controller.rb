class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    rand(10000000).times do |i|
      i + rand(1..20)
    end

    if @book.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append('all_books', 
                                                   partial: "books/book", 
                                                   locals: { book: @book }
                                                  )
        end
        format.html { redirect_to root_path }
      end
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :author)
  end

end
