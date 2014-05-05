class TextsController < ApplicationController
 
  def send_text_message 
    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => 16177671758,
      :body => "You have a new follower on the Metis Network!"
    )
  end
end

