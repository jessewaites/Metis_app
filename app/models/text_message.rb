class TextMessage

  attr_reader :user

  def initialize user
    @user = user
  end

  def send
    twilio_client = Twilio::REST::Client.new  ENV.fetch("account_sid"), ENV.fetch("auth_token")
    twilio_client.account.sms.messages.create(
      from: ENV.fetch('twilio_phone_number'),
      to: "1#{user.cell_number}",
      body: "#{user.name}, thanks for buying my book! http://piratebroadcast.github.io "
    )
  end

end
