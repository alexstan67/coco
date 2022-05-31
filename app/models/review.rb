class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  validates :rating, presence: true, inclusion: { in: [0, 1, 2, 3, 4, 5] }
  validates :comment, presence: true, length: { minimum: 10 }
end
