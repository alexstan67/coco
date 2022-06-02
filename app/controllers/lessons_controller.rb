class LessonsController < ApplicationController
  def index
    if params[:code_language].present?
      @lessons = Lesson.where(coding_language: params[:code_language])
    else
      @lessons = Lesson.all
    end

    @users = User.where(id: @lessons.pluck(:user_id))
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        image_url: helpers.asset_url(user.lessons.first.language_image)
      }
    end
  end
  def show
    @lesson = Lesson.find(params[:id])
    @booking = Booking.new
    @rating_average = 4
  end

  def get
    @lessons = lessons.where(lessons.language_image)
  end
end
