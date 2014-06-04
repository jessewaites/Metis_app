class TextMessage

  attr_reader :user


  def initialize user
    @user = user
  end

  def send text 
    twilio_client = Twilio::REST::Client.new  ENV.fetch("account_sid"), ENV.fetch("auth_token")
    twilio_client.account.sms.messages.create(
      from: ENV.fetch('twilio_phone_number'),
      to: "#{user.cell_number}",
      body: text
    )
  end

end
