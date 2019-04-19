


User.delete_all
Restaurant.delete_all
Review.delete_all

puts "Generating Users"
(1..5).each do |i|
  putc '.'
  User.create(name: Faker::Name.name)
end
#generating 5 users

foodTypes = ["spicy", "sweet", "salty", "tangy"]
puts
puts "Generating Restaurants"
(1..7).each do |i|
  putc '.'
  Restaurant.create(name: Faker::Company.name, food_type: foodTypes.sample, location: Faker::Address.city)
end

puts
puts "Generating Review"

Review.create(name: "review", restaurant: Restaurant.last, user: User.last, rating: 3)
# Review.create(rest_id: 2,user_id: 1, rating: 3)
# Review.create(rest_id: 3,user_id: 3, rating: 3)
# Review.create(rest_id: 4,user_id: 4, rating: 3)
