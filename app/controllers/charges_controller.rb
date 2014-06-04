class ChargesController < ApplicationController

  def new
  end
  
  def create  
    charge = Charge.new(current_user, params[:stripeToken])
    charge.process
    current_user.purchased_book = true
    current_user.save
    message = TextMessage.new(current_user)
    message.send("#{current_user.name}, thanks for coming by! My online CV is available at http://piratebroadcast.github.io. Keep in touch! -Jesse")
    redirect_to book_downloads_path
    flash[:notice] = "Thank you for your purchase!"
  end
end
