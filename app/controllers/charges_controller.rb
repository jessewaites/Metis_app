class ChargesController < ApplicationController

  def new
  end
  
  def create
    charge = Charge.new(current_user, params[:stripeToken])
    charge.process
    current_user.purchased_book = true
    current_user.save
    message = TextMessage.new(current_user)
    message.send
    flash[:notice] = "Thank you for your purchase!"
    redirect_to book_downloads_path
  end
end  
