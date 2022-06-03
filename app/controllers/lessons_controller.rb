class LessonsController < ApplicationController
  def index
    if params[:code_language].present? && Lesson.where(coding_language: params[:code_language]).count != 0
        @lessons = Lesson.where(coding_language: params[:code_language])
    # elsif @lessons.count == 0
    #       @lessons = Lesson.all
    else
      @lessons = Lesson.all
    end

    @users = User.where(id: @lessons.pluck(:user_id))
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: render_to_string(partial: "info_window", locals: { user: user }),
        image_url: helpers.asset_url(user.lessons.first.language_image)
      }
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    @booking = Booking.new
    @rating_average = 4
  end
end
