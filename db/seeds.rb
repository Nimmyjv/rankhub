# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.first
urls = ['csnipp.com', 'redpanthers.co', 'google.com']

urls.each do |url|
  user.collections.first.websites.create!(url: url)
end

Website.all.each do |site|
  20.times do |n|
    rank = 1614533-n
    date = Time.at(0.0 + rand * (Time.now.to_f - 0.0.to_f))
    site.alexaranks.create!(rank: rank, created_at: date)
  end
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')