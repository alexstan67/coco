class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_many :lessons
  has_many :bookings
  has_many :teacher_bookings, through: :lessons, source: :bookings
  has_many :reviews

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :first_name, :last_name, :phone, :address, presence: true
end
