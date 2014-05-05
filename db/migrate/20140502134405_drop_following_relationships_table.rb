class DropFollowingRelationshipsTable < ActiveRecord::Migration
  def change
    drop_table :following_relationships do |t|
    t.integer  "followed_user_id"
    t.integer  "follower_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    end
  end
end
