require 'faker'

puts 'Cleaning database...'
Restaurant.destroy_all
Review.destroy_all

puts 'Creating restaurants and reviews...'
10.times do
  restaurant = Restaurant.new(
    name: Faker::Company.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    phone_number: Faker::PhoneNumber.phone_number,
    category: %w[chinese italian japanese french belgian].sample
  )
  restaurant.save!
  5.times do
    review = Review.new(
      content: Faker::Quote.most_interesting_man_in_the_world,
      rating: %w[0 1 2 3 4 5].sample
    )
    review.restaurant = restaurant
    review.save!
  end
end
puts 'Finished!'
