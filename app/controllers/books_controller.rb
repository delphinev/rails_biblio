class BooksController < ApplicationController
  def index
  	@books = Book.all
    @book = Book.new
  end

  def create
  	# book = Book.new
  	# book.title = params[:title]
  	# book.save
  	@book= Book.create title: params[:title]
    if @book.save
      flash[:success] = "The book has been added."
  	  redirect_to "/books"
    else
      @books = Book.all
      render "index"
    end
  end

  def show
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
    if @book.update title: params[:title]
      flash[:success] = "The book has been updated."
  	  redirect_to "/books/#{params[:id]}"
    else
      render "show"
    end
  end

  def destroy
  	Book.find(params[:id]).destroy
  	redirect_to "/books"
  end
end
