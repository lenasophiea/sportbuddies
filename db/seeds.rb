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
Message.destroy_all
Conversation.destroy_all
User.destroy_all

Sport.destroy_all
BuddyRequest.destroy_all


# puts "Creating users"


#   names = %w[amelie lena mohit marcel jana]
#   names.each do |name|
#     name = User.new(
#       email: "#{name}@lewagon.com",
#       password: "123456",
#       description: "I like doing sport with nice people :) I am a nice person, do you want to meet?",
#       age: 20,
#       gender: Faker::Gender.type,
#     )
#     name.save!
# end


puts "creating user with image"
1.times do
  user = User.create(
  name: "Dieter",
  description: "I'm a SEO specialist and just recently moved to Berlin. I'm up for all ball games - looking forward to make new friends :)",
  age: "30",
  gender:"male",
  email: "dieter@lewagon.com",
  password: "123456",
  )
  url = 'https://avatars3.githubusercontent.com/u/39704300?v=4'
  filename = File.basename(URI.parse(url).path)
  file = URI.open(url)
  user.photo.attach(io: file, filename: filename)
  user.save!
  # buddy_request = BuddyRequest.new(
  #   sport: Sport.last,
  #   user: user,
  #   date: Date.new(2020,9,1)
  #   )
  # buddy_request.save!


puts "creating user with image"
1.times do
  user = User.create(
  name: "Lena",
  description: "Just started with sports and would love to try out different things like sailing, tennis, running… Everything outside - I'm in!",
  age: "28",
  gender:"female",
  email: "lena@lewagon.com",
  password: "123456",
  )
  url = 'https://avatars2.githubusercontent.com/u/67368929?v=4'
  filename = File.basename(URI.parse(url).path)
  file = URI.open(url)
  user.photo.attach(io: file, filename: filename)
  user.save!
  # buddy_request = BuddyRequest.new(
  #   sport: Sport.last,
  #   user: user,
  #   date: Date.new(2020,9,1)
  #   )
  # buddy_request.save!
end

puts "creating user with image"
1.times do
  user = User.create(
  name: "Mohit ",
  description: "I'm a sporty guy, born and raised in Berlin. I love to meet new people and I love to do sports!",
  age: "29",
  gender:"male",
  email: "mohit@lewagon.com",
  password: "123456",
  )
  url = 'https://avatars3.githubusercontent.com/u/53264869?v=4'
  filename = File.basename(URI.parse(url).path)
  file = URI.open(url)
  user.photo.attach(io: file, filename: filename)
  user.save!
  # buddy_request = BuddyRequest.new(
  #   sport: Sport.last,
  #   user: user,
  #   date: Date.new(2020,9,1)
  #   )
  # buddy_request.save!
end

# puts "creating user with image"
# 1.times do
#   user = User.create(
#   name: "Amelie Kerne",
#   description: "I love to go running! I would love to train for a marathon with like minded people! Can't wait for your buddy request!",
#   age: "28",
#   gender:"female",
#   email: "amelie@lewagon.com",
#   password: "123456",
#   )
#   url = 'https://avatars2.githubusercontent.com/u/65012603?v=4'
#   filename = File.basename(URI.parse(url).path)
#   file = URI.open(url)
#   user.photo.attach(io: file, filename: filename)
#   user.save!
# #   # buddy_request = BuddyRequest.new(
# #   #   sport: Sport.last,
# #   #   user: user,
# #   #   date: Date.new(2020,9,1)
# #   #   )
# #   # buddy_request.save!
# end


puts "creating user with image"
1.times do
  user = User.create(
  name: "Claire Demont",
  description: "Freelance Fullstack RoR Developer, improv comedian, cinema addict and yogi addict looking for new challenges.",
  age: "25",
  gender:"female",
  email: "claire@lewagon.com",
  password: "123456",
  )
  url = 'https://avatars3.githubusercontent.com/u/45850166?v=4'
  filename = File.basename(URI.parse(url).path)
  file = URI.open(url)
  user.photo.attach(io: file, filename: filename)
  user.save!
#   # buddy_request = BuddyRequest.new(
#   #   sport: Sport.last,
#   #   user: user,
#   #   date: Date.new(2020,9,1)
#   #   )
#   # buddy_request.save!
end

puts "#{User.count} users created"

# puts "Creating sports"
#   addresses = [
#   "Rudi-Dutschke-Straße 26, 10969 Berlin",
#   "Pariser Platz, 10117, Berlin",
#   "Platz der Republik 1, 11011, Berlin",
#   "Bodestraße 1-3, 10178 Berlin",
#   "Bernauer Straße 111, 13355 Berlin",
#   "Unter den Linden 2, 10117 Berlin",
#   "Panoramastraße 1 A, 10178 Berlin",
#   "Friedrichstraße 43-45, 10969 Berlin",
#   "Spandauer Damm 10, 14059 Berlin",
#   "Gendarmenmarkt, 10117 Berlin",
#   "Lindenstraße 9-14, 10969 Berlin",
#   "Trebbiner Straße 9, D-10963 Berlin-Kreuzberg",
#   "Cora-Berliner-Straße 1, 10117 Berlin",
#   "Str. des 17. Juni, 10785 Berlin",
#   "Bodestraße 1-3, 10178 Berlin",
#   "Schloßpl. 1, 10178 Berlin",
#   "Am Lustgarten, 10178 Berlin",
#   "Niederkirchnerstraße 8, 10963 Berlin",
#   "Hardenbergplatz 8, 10787 Berlin",
#   "Königin-Luise-Strasse 6-8, 14195 Berlin",
#   "Nikolaikirchplatz, 10178 Berlin",
#   "Breitscheidplatz, 10789 Berlin"
# ]
puts "creating user sports"

1.times do |i|
  file = URI.open('https://pixfeeds.com/images/basketball/1280-675234090-group-of-friends-playing-basketball.jpg')
  sport = Sport.new(
    name: "Basketball",
    description: "Physical fitness – playing basketball on a regular basis improves coordination & speed, as well as improving strength & cardiovascular health. Ball handling & dribbling also improve fine motor skills.",
    address: "Bodestraße 1-3, 10178 Berlin"
  )
  sport.save!
  sport.photo.attach(io: file, filename: "sport.jpg", content_type: 'image/jpg')
end



1.times do |i|
  file = URI.open('https://pixfeeds.com/images/sports/tennis/1280-497273591-friends-playing-tennis.jpg')
  sport = Sport.new(
    name: "Tennis",
    description: "Tennis is one of the most popular individual sports in the world. In tennis the player uses a racquet to hit a ball over a net into the opponents court.",
    address: "Breitscheidplatz, 10789 Berlin"
  )
  sport.save!
  sport.photo.attach(io: file, filename: "sport.jpg", content_type: 'image/jpg')
end

1.times do |i|
  file = URI.open('https://newcastlepools.com.au/wp-content/uploads/2018/12/enews-carnival.jpg')
  sport = Sport.new(
    name: "Swimming",
    description: "Swimming is a great workout because you need to move your whole body against the resistance of the water. ... keeps your heart rate up but takes some of the impact stress off your body.",
    address: "Nikolaikirchplatz, 10178 Berlin"
  )
  sport.save!
  sport.photo.attach(io: file, filename: "sport.jpg", content_type: 'image/jpg')
end


1.times do |i|
  file = URI.open('https://images.unsplash.com/flagged/photo-1571771710019-ca58cf80f225?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
  sport = Sport.new(
    name: "Football",
    description: "Football teaches cooperation and team work, helps develop positive social skills and teaches respect for others. It helps build self-confidence, a positive self-image and self-worth.",
    address: "Rudi-Dutschke-Straße 26, 10969 Berlin"
    )
sport.save!
    sport.photo.attach(io: file, filename: "football.jpg", content_type: 'image/jpg')
  end


1.times do |i|
  file = URI.open('https://content.active.com/Assets/Active.com+Content+Site+Digital+Assets/Cycling/Galleries/Slow+Friends/Be+Supportive.jpg')
  sport = Sport.new(
    name: "Cycling",
    description: "Riding a bike is healthy, fun and a low-impact form of exercise for all ages. Cycling is easy to fit into your daily routine by riding to the shops, park, school or work",
    address: "Pariser Platz, 10117, Berlin"
    )
sport.save!
    sport.photo.attach(io: file, filename: "cycling.jpg", content_type: 'image/jpg')
  end


1.times do |i|
  file = URI.open('https://thumbs.dreamstime.com/b/teenage-friends-playing-volleyball-beach-14457507.jpg')
  sport = Sport.new(
    name: "Volleyball",
    description: "The activities required when playing volleyball strengthen the upper body, arms, shoulders, thighs, abdominals, and lower legs. In addition, volleyball improves hand-eye coordination, reflexes, and balance.",
    address: "Platz der Republik 1, 11011, Berlin"
    )
sport.save!
    sport.photo.attach(io: file, filename: "volleyball.jpg", content_type: 'image/jpg')
  end
  puts "#{Sport.count}created"

puts "creating buddy_requests"
  1.times do
  buddy_request = BuddyRequest.new(
  sport: Sport.last,
  user: User.first,
  date: Date.new(2020,9,7)
  )
  buddy_request.save!
  end

  1.times do
  buddy_request = BuddyRequest.new(
  sport: Sport.last,
  user: User.last,
  date: Date.new(2020,9,7)
  )
  buddy_request.save!
  end

end
