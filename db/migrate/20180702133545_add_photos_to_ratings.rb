class AddPhotosToRatings < ActiveRecord::Migration[5.2]
  def change
    add_column :ratings, :photos, :json
  end
end
