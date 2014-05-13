class User < ActiveRecord::Base
  include PgSearch
  multisearchable against: [:name]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :invitable
  belongs_to :city
  belongs_to :cohort
  has_many :statuses
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :cell_number, presence: true, uniqueness: true
  validates :github_username, presence: true

  def friends? other_user
    friend_ids.include? other_user.id
  end

  def follow other_user
    friendships.create(friend: other_user)
  end

  def unfollow other_user
    friends.destroy(other_user)
  end
     
end
