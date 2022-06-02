class Booking < ApplicationRecord
  STATUS = ["accepted", "rejected", "pending"]
  belongs_to :user
  belongs_to :lesson
  validates :total_price, presence: true, numericality: true
  validates :duration_min, presence: true, numericality: { only_integer: true }
  validates :teaching_date, presence: true
  validates :status, inclusion: {in: STATUS}
end
