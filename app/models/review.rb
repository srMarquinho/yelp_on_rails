class Review < ApplicationRecord
  # belongs_to :user  # set by default on Rails 5
  belongs_to :restaurant
  validates :rating, inclusion: (1..5)

  validates :user_id, uniqueness: { scope: :restaurant, message: "has reviewed this restaurant already" }
end
