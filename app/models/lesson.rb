class Lesson < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :hourly_prices, presence: true, numericality: true
  validates :coding_language, :description, presence: true
end
