class AddPhotosToRatings < ActiveRecord::Migration[5.2]
  def change
    add_column :ratings, :photo, :string
  end
end
