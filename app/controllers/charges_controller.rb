class ChargesController < ApplicationController

  def new
  end
  
  def create  
    charge_card
    #send_text_message
    redirect_to book_downloads_path
    flash[:notice] = "Thank you for your purchase!"
  end

  private

  def charge_card
    charge = Charge.new(current_user, params[:stripeToken])
    charge.process
    current_user.purchased_book = true
    current_user.save
  end

  def send_text_message
    message = TextMessage.new(current_user)
    message.send("#{current_user.name}, thanks for coming by! My online CV is available at http://JesseWaites.com - Keep in touch! Jesse") 
  end
end
