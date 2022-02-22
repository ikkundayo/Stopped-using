class BookcommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = Bookcomment.new(book_comment_params)
    comment.user_id = current_user.id
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:book_id])
    book.destroy
    render 'show'
  end

  


  private

  def book_comment_params
    params.require(:bookcomment).permit(:comment)
  end

end
