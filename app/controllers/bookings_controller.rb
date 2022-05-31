class BookingsController < ApplicationController
  def create

  end

  def index
    # return a collection with all bookings
    @bookings = current_user.bookings
    console
    # return the first booking
  end

end
