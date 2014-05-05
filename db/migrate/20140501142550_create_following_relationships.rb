class CreateFollowingRelationships < ActiveRecord::Migration
  def change
    create_table :following_relationships do |t|
      t.integer :followed_user_id, index: true
      t.integer :follower_id, index: true
      t.datetime "created_at"
      t.datetime "updated_at"
     
    end
  end
end
