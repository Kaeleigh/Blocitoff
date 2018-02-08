# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'faker'

#Create fake users
4.times do
  User.create!(
    email:  Faker::Internet.email,
    password: 'hidden'
  )
  # u.skip_confirmation!
  # u.save!
end

users = User.all

#Create fake items
20.times do
  Item.create!(
    name: Faker::StarTrek.character,
    user: users.sample
  )
end

items = Item.all

admin = User.create!(
   email:          'admin@example.com',
   password:       'password',
   confirmed_at:   Time.now
  )

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
