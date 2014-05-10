class Charge
  AMOUNT = 20000
  DESCRIPTION = 'Jesses Book'
  
  attr_reader :user, :token

  def initialize user, token 
    @user = user
    @token = token
  end
  
  def process
    customer = create_customer
    create_charge customer
  end

  def create_customer
    Stripe::Customer.create(
      email: user.email,
      card: token
      )
  end
  
  def create_charge customer
   Stripe::Charge.create(
     customer: customer.id,
     amount: Charge::AMOUNT,
     description: Charge::DESCRIPTION,
     currency: 'usd'
     )
 end
end  
