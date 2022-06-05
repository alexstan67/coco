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

puts "Cleaning the database..."
Review.destroy_all
Booking.destroy_all
Lesson.destroy_all
User.destroy_all

# Create normal users
normal_users = []
puts "Creating user 1"
file = File.open(Rails.root.join("app/assets/images/Alex.jpg"))
user = User.new
user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
user.email = "alex@coco.com"
user.password = "123123"
user.first_name = "Alex"
user.last_name = "Stanescot"
user.address = Faker::Address.full_address
user.phone = Faker::PhoneNumber.cell_phone
user.save
normal_users << user.id

puts "Creating user 2..."
file = File.open(Rails.root.join("app/assets/images/Riza.jpg"))
user = User.new
user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
user.email = "riza@coco.com"
user.password = "123123"
user.first_name = "Riza"
user.last_name = "Santoso"
user.address = Faker::Address.full_address
user.phone = Faker::PhoneNumber.cell_phone
user.save
normal_users << user.id

puts "Creating user 3..."
file = File.open(Rails.root.join("app/assets/images/person_1.jpg"))
user = User.new
user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
user.email = "glen@coco.com"
user.password = "123123"
user.first_name = "Glen"
user.last_name = "Smith"
user.address = Faker::Address.full_address
user.phone = Faker::PhoneNumber.cell_phone
user.save
normal_users << user.id

#Create teachers
teachers = []
puts "Creating teacher 1..."
file = File.open(Rails.root.join("app/assets/images/person_2.jpg"))
user = User.new
user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
user.email = "christina@coco.com"
user.password = "123123"
user.first_name = "Christina"
user.last_name = "Sugiono"
user.address = "Carrer muntaner #{rand(10..100)}, barcelona"
user.phone = Faker::PhoneNumber.cell_phone
user.save
teachers << user.id

puts "Creating teacher 2..."
file = File.open(Rails.root.join("app/assets/images/person_3.jpg"))
user = User.new
user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
user.email = Faker::Internet.email
user.password = "123123"
user.first_name = Faker::Name.first_name
user.last_name = Faker::Name.last_name
user.address = "Carrer muntaner #{rand(10..100)}, barcelona"
user.phone = Faker::PhoneNumber.cell_phone
user.save
teachers << user.id

puts "Creating teacher 3..."
file = File.open(Rails.root.join("app/assets/images/person_4.jpg"))
user = User.new
user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
user.email = Faker::Internet.email
user.password = "123123"
user.first_name = Faker::Name.first_name
user.last_name = Faker::Name.last_name
user.address = "Carrer muntaner #{rand(10..100)}, barcelona"
user.phone = Faker::PhoneNumber.cell_phone
user.save
teachers << user.id

puts "Creating teacher 3..."
file = File.open(Rails.root.join("app/assets/images/person_5.jpg"))
user = User.new
user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
user.email = Faker::Internet.email
user.password = "123123"
user.first_name = Faker::Name.first_name
user.last_name = Faker::Name.last_name
user.address = "Carrer muntaner #{rand(10..100)}, barcelona"
user.phone = Faker::PhoneNumber.cell_phone
user.save
teachers << user.id

puts "Creating teacher 4..."
file = File.open(Rails.root.join("app/assets/images/person_6.jpg"))
user = User.new
user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
user.email = Faker::Internet.email
user.password = "123123"
user.first_name = Faker::Name.first_name
user.last_name = Faker::Name.last_name
user.address = "Carrer muntaner #{rand(10..100)}, barcelona"
user.phone = Faker::PhoneNumber.cell_phone
user.save
teachers << user.id

puts "Creating lessons and bookings..."
teachers.each do |teacher|
  1.times do
    lesson = Lesson.new
    lesson.user_id = teacher
    lesson.hourly_prices = 100 + rand(20)
    lesson.coding_language = ["ruby", "css3", "python", "javascript", "html5", "sql"].sample
    # lesson.description = Faker::Lorem.paragraph(sentence_count: 3)
    lesson.description = description.sample
    lesson.language_image = "#{lesson.coding_language}.png"
    lesson.save
    1.times do
      booking = Booking.new
      booking.user_id = normal_users.sample
      booking.lesson_id = lesson.id
      booking.duration_min = [60, 90, 120].sample
      booking.total_price = lesson.hourly_prices.to_f * (booking.duration_min / 60)
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
