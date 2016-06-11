class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :Accounts_id
      t.integer :friend_id
      t.string :create
      t.string :destroy

      t.timestamps null: false
    end
  end
end
