# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"


puts "Deleting existing users and sports"
Conversation.destroy_all
User.destroy_all
Sport.destroy_all
BuddyRequest.destroy_all

puts "Creating users"

  names = %w[amelie lena mohit marcel jana]
  names.each do |name|
    name = User.new(
      email: "#{name}@lewagon.com",
      password: "123456",
      description: "I like doing sport with nice people :) I am a nice person, do you want to meet?",
      age: 20,
      gender: Faker::Gender.type,
    )
    name.save!
end
puts "#{User.count} users created"

puts "Creating sports"
  addresses = [
  "Rudi-Dutschke-Straße 26, 10969 Berlin",
  "Pariser Platz, 10117, Berlin",
  "Platz der Republik 1, 11011, Berlin",
  "Bodestraße 1-3, 10178 Berlin",
  "Bernauer Straße 111, 13355 Berlin",
  "Unter den Linden 2, 10117 Berlin",
  "Panoramastraße 1 A, 10178 Berlin",
  "Friedrichstraße 43-45, 10969 Berlin",
  "Spandauer Damm 10, 14059 Berlin",
  "Gendarmenmarkt, 10117 Berlin",
  "Lindenstraße 9-14, 10969 Berlin",
  "Trebbiner Straße 9, D-10963 Berlin-Kreuzberg",
  "Cora-Berliner-Straße 1, 10117 Berlin",
  "Str. des 17. Juni, 10785 Berlin",
  "Bodestraße 1-3, 10178 Berlin",
  "Schloßpl. 1, 10178 Berlin",
  "Am Lustgarten, 10178 Berlin",
  "Niederkirchnerstraße 8, 10963 Berlin",
  "Hardenbergplatz 8, 10787 Berlin",
  "Königin-Luise-Strasse 6-8, 14195 Berlin",
  "Nikolaikirchplatz, 10178 Berlin",
  "Breitscheidplatz, 10789 Berlin"
]

6.times do |i|
  file = URI.open('https://europa.eu/youth/sites/default/files/article/55343908%20-%20%C2%A9%20shutterstock.com%20-%20YanLev_4.jpg')
  sport = Sport.new(
    name: Faker::Team.sport,
    description: "Super sport to have fun!",
    address: addresses[i]
  )
  sport.save!
  sport.photo.attach(io: file, filename: "sport.jpg", content_type: 'image/jpg')
end
puts "#{Sport.count} sports created"

puts "creating buddy_requests"
  3.times do
  buddy_request = BuddyRequest.new(
  sport: Sport.last,
  user: User.all.sample,
  date: Date.new(2020,9,1)
  )
  buddy_request.save!
  end

puts "creating user with image"
1.times do
  user = User.create(
  name: "mona",
  description: "She is a SEO specialist and lives in Aus",
  age: "30",
  gender:"female",
  email: "mona@lewagon.com",
  password: "123456",
  )
  url = 'https://res.cloudinary.com/dminhw5d0/image/upload/v1598451035/pexels-the-lazy-artist-gallery-1289107_picw0h.jpg'
  filename = File.basename(URI.parse(url).path)
  file = URI.open(url)
  user.photo.attach(io: file, filename: filename)
  user.save!
  buddy_request = BuddyRequest.new(
    sport: Sport.last,
    user: user,
    date: Date.new(2020,9,1)
    )
  buddy_request.save!
end


