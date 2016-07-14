class Review < ApplicationRecord
  # belongs_to :user  # set by defout on Rails 5
  belongs_to :restaurant
  validates :rating, inclusion: (1..5)
end
