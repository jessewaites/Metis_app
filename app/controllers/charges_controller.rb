class ChargesController < ApplicationController

  def new
  end
  
  def create
    charge = Charge.new(current_user, params[:stripeToken])
    charge.process
    current_user.purchased_book = true
    current_user.save
    redirect_to book_downloads_path
    flash[:notice] = "Thank you for your purchase!"
  end

end
