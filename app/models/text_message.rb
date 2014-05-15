class TextMessage

  attr_reader :user

  def initialize user
    @user = user
  end

  def send
    twilio_client = Twilio::REST::Client.new  ENV.fetch("account_sid"), ENV.fetch("auth_token")
    twilio_client.account.sms.messages.create(
      from: ENV.fetch('twilio_phone_number'),
      to: "#{user.cell_number}",
      body: "#{user.name}, thanks for coming by! My online CV is available at http://piratebroadcast.github.io. Keep in touch! -Jesse"
    )
  end

end
