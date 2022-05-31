require 'faker'
require 'date'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning the database..."
Review.destroy_all
Booking.destroy_all
Lesson.destroy_all
User.destroy_all

puts "Creating users, lessons"

5.times do
  user = User.new
  user.email = Faker::Internet.email
  user.password = "123123"
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.address = Faker::Address.full_address
  user.phone = Faker::PhoneNumber.cell_phone
  user.save
  10.times do
    lesson = Lesson.new
    lesson.user_id = user.id
    lesson.hourly_prices = 100 + rand(20)
    lesson.coding_language = ["ruby", "c", "php", "javascript", "Ruby on Rails"].sample
    lesson.description = Faker::Lorem.paragraph(sentence_count: 3)
    lesson.save
    6.times do
      booking = Booking.new
      booking.user_id = lesson.user_id
      booking.lesson_id = lesson.id
      booking.duration_min = [60, 90, 120].sample
      booking.total_price = lesson.hourly_prices.to_f * booking.duration_min
      booking.teaching_date = Date.today()
      booking.comment = Faker::Lorem.paragraph(sentence_count: 3)
      booking.save
      3.times do
        review = Review.new
        review.user_id = booking.user_id
        review.rating = [0, 1, 2, 4, 5].sample
        review.booking_id = booking.id
        review.comment = Faker::Lorem.paragraph(sentence_count: 3)
        review.save
      end
    end
  end
end

puts "#{User.all.count} created!"
puts "#{Lesson.all.count} created!"
puts "#{Booking.all.count} created!"
puts "#{Review.all.count} created!"
