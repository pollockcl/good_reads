class BooksController < ApplicationController
  def show
    render locals: { book: Book.find(params[:id])}
  end
end
