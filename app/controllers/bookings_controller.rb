class BookingsController < ApplicationController
  def create
    Booking.create(booking_params)
  end

  private

  def booking_params
    params.require(:booking).permit(:total_price, :duration_min, :teaching_date, :user_id, :lesson_id, :comment)
  end
end