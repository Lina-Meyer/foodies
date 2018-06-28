class Restaurant < ApplicationRecord
  has_many :ratings
  has_many :users, through: :ratings

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
