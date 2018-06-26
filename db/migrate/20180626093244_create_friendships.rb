class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.string :status
      t.references :user_id_1, foreign_key: { to_table: :users }
      t.references :user_id_2, foreign_key: { to_table: :users }
    end
  end
end
