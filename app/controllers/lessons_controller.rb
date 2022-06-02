class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
  end
  def show
    @lesson = Lesson.find(params[:id])
    @booking = Booking.new
    @rating_average = 4
  end
end
