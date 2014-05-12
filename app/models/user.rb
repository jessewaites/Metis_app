class User < ActiveRecord::Base
  include PgSearch
  multisearchable against: [:name]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :invitable
  belongs_to :city
  belongs_to :cohort
  has_many :statuses
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :cell_number
  validates_presence_of :github_username
     
end
