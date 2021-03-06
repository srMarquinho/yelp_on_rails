class Restaurant < ApplicationRecord
  # belongs_to :user  # set by defout on Rails 5
  validates :name, length: { minimum: 3 }, uniqueness: true

  has_many :reviews, dependent: :destroy

  def average_rating
    return 'N/A' if reviews.none?
    reviews.average(:rating)
  end
end
