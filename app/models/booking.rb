class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  validates :total_price, presence: true, numericality: true
  validates :duration_min, presence: true, numericality: { only_integer: true }
  validates :teaching_date, presence: true
end
