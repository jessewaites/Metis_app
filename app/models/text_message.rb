class TextMessage

  def initialize current_user
    @user = current_user
  end

  def send
    @twilio_client = Twilio::REST::Client.new  ENV.fetch("account_sid"), ENV.fetch("auth_token")
    @twilio_client.account.sms.messages.create(
      :from => ENV.fetch('twilio_phone_number'),
      :to => ENV.fetch('number_to_send_to'),
      :body => "#{@user.name} just bought your book!"
    )
  end

end
