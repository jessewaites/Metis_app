class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :city
  belongs_to :cohort
  has_many :statuses
  has_many :friendships
  has_many :friends, through: :friendships    
end
