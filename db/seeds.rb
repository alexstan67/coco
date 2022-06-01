require 'faker'
require 'date'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

description = ["is a computer science educator with three years of experience teaching middle school students everything from coding with Scratch and Python to creating 3D models online.", "is an undergraduate student at Johns Hopkins University studying Computer Science and Public Health. She volunteers as a tutor for high school students with intellectual disabilities and is on a team that holds sustainability hackathons. Julia hopes to show her students how fun and rewarding coding can be. Her own coding journey began with a class in high school, which has since launched her continued quest to learn and master programming languages.", "recently graduated from the University of Vermont with a B.S. in computer science. Her love for teaching began when she helped to teach swimming lessons at 10 years old. Ever since then she has wanted to be a teacher. She loves to show her students the limitless possibilities they can create with coding and loves to encourage creativity in every lesson."]
address = ["Canggu, Bali", "Kuta, Bali", "Ubud, Bali"]

puts "Cleaning the database..."
Review.destroy_all
Booking.destroy_all
Lesson.destroy_all
User.destroy_all

puts "Creating users, lessons"

# Create normal users
3.times do
  file = File.open(Rails.root.join("app/assets/images/image.png"))
  user = User.new
  user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  user.email = Faker::Internet.email
  user.password = "123123"
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.address = address.sample
  user.phone = Faker::PhoneNumber.cell_phone
  user.save
end

#Create teachers
5.times do
  file = File.open(Rails.root.join("app/assets/images/image.png"))
  user = User.new
  user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  user.email = Faker::Internet.email
  user.password = "123123"
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.address = address.sample
  user.phone = Faker::PhoneNumber.cell_phone
  user.save
  1.times do
    lesson = Lesson.new
    lesson.user_id = user.id
    lesson.hourly_prices = 100 + rand(20)
    lesson.coding_language = ["ruby", "css3", "python", "javascript", "html5", "sql"].sample
    # lesson.description = Faker::Lorem.paragraph(sentence_count: 3)
    lesson.description = description.sample
    lesson.save
    1.times do
      booking = Booking.new
      booking.user_id = lesson.user_id
      booking.lesson_id = lesson.id
      booking.duration_min = [60, 90, 120].sample
      booking.total_price = lesson.hourly_prices.to_f * booking.duration_min
      booking.teaching_date = Date.today()
      booking.comment = Faker::Lorem.paragraph(sentence_count: 3)
      booking.save
      review = Review.new
      review.user_id = booking.user_id
      review.rating = [0, 1, 2, 4, 5].sample
      review.booking_id = booking.id
      review.comment = Faker::Lorem.paragraph(sentence_count: 3)
      review.save
    end
  end
end

puts "#{User.all.count} created!"
puts "#{Lesson.all.count} created!"
puts "#{Booking.all.count} created!"
puts "#{Review.all.count} created!"
