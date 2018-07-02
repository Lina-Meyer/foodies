class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  mount_uploader :photo, PhotoUploader
end
