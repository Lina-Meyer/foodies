class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "user", foreign_key: "friend_id"
end
