class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.text :header
      t.text :description
      t.string :atmosphere
      t.integer :stars
      t.string :photo
      t.string :video
      t.references :user, foreign_key: true
      t.references :restaurant, foreign_key: true
    end
  end
end
