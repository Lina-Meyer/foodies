class Restaurant < ApplicationRecord
  has_many :ratings
  has_many :users, through: :ratings
  has_many :favorites

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def liked?(user)
    return unless user
    user.favorite_restaurants.include?(self) if user.favorite_restaurants
  end

end
