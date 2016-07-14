class Restaurant < ApplicationRecord
  # belongs_to :user  # set by defout on Rails 5
  has_many :reviews, dependent: :destroy
  validates :name, length: { minimum: 3 }, uniqueness: true
end
