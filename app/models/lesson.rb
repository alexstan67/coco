class Lesson < ApplicationRecord
  belongs_to :user
  validates :hourly_prices, presence: true, numericality: true
  validates :coding_language, :description, presence: true
end
