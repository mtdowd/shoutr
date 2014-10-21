class CreateFollowRelationships < ActiveRecord::Migration
  def change
    create_table :follow_relationships do |t|
      t.belongs_to :follower
      t.belongs_to :followed_user

      t.timestamps
    end
  end
end
