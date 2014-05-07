class BookDownloadsController < ApplicationController
  before_filter :book_purchase_dispatch

  def show
  end

  private

  def book_purchase_dispatch
    unless current_user && current_user.purchased_book
      redirect_to root_path
      flash[:notice] = "You must be logged in and have purchased 
      the book in order to access that section."
    end  
  end
end
