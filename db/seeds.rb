require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning the database..."
User.destroy_all

puts "Creating users, lessons"

5.times do
  user = User.new
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.address = Faker::Address.full_address
  user.phone = Faker::PhoneNumber.cell_phone
  user.save
  10.times do
    lesson = Lesson.new
    lesson.teacher_id = user.id
    hourly_price = 100 + random(20)
    coding_language = ["ruby", "c", "php", "javascript", "Ruby on Rails"].sample(1)
    lesson.lesson_description = Faker::Lorem.paragraph(sentence_count: 3)
    lesson.save
    6.times do
      booking = Booking.new
      booking.user_id = lesson.teacher_id
      booking.lesson_id = lesson_id
      booking.duration_min = [60, 90, 120].sample(1)
      total_price = lesson.hourly_price * booking.duration_min
      booking.comment = Faker::Lorem.paragraph(sentence_count: 3)
      booking.save
      3.times do
        review = Review.new
        review.user_id = booking.user_id
        rating = [0, 1, 2, 4, 5].sample(1)
        review.booking_id = booking.id
        review.comment = Faker::Lorem.paragraph(sentence_count: 3)
      end 
    end
  end
end

puts "#{User.all.count} created!"
puts "#{Lesson.all.count} created!"
puts "#{Booking.all.count} created!"
puts "#{Reveiw.all.count} created!"
