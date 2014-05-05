class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: "User"
  validate :cannot_follow_yourself
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  private

  def cannot_follow_yourself
    if user_id == friend_id
      errors.add(:base, "You can't follow yourself.")
    end
  end

end
