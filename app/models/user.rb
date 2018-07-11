class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :photo, PhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ratings
  has_many :restaurants, through: :ratings
  has_many :friendships
  has_many :favorites
  has_many :favorite_restaurants, through: :favorites, source: :restaurant

  validates :first_name, presence:true
  validates :last_name, presence:true
end
