class BookingsController < ApplicationController
  def create
    Booking.create(booking_params)
  end

  def index
    # return a collection with all bookings
    @bookings = current_user.teacher_bookings
  end

  def accept
    @booking = Booking.find(params["booking_id"])
    if @booking.update(status: "accepted")
      flash[:alert] = "Booking Accepted"
      redirect_to bookings_path
    else
      flash[:alert] = "Error, try again"
      redirect_to bookings_path
    end
  end

  def reject
    @booking = Booking.find(params["booking_id"])
    if @booking.update(status: "rejected")
      flash[:alert] = "Sorry, Booking Rejected"
      redirect_to bookings_path
    else
      flash[:alert] = "Error, try again"
      redirect_to bookings_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:total_price, :duration_min, :teaching_date, :user_id, :lesson_id, :comment)
  end
end
