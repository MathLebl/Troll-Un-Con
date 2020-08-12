# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Creating Users'

user = User.new(
  username: "Math",
  email: "mathl@gmail.com",
  password: "TrollUnCon"
  )
user.save!

user = User.new(
  username: "Tom",
  email: "tomp@gmail.com",
  password: "TrollUnCon"
  )
user.save!

puts 'Users done'
