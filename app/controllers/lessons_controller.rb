class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all

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
end
