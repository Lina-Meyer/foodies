class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.string :status, default: "pending"
      t.string :action, default: 'no'
      t.references :user, foreign_key: true
      t.references :friend, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
