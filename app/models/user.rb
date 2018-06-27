class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ratings
  has_many :restaurants, through: :ratings
  has_many :friendships

  validates :first_name, presence:true
  validates :last_name, presence:true

  mount_uploader :photo, PhotoUploader
end
