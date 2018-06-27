# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Rating.destroy_all
Friendship.destroy_all
Restaurant.destroy_all
User.destroy_all

lina = User.create!(email: "lina.meyer@gmail.com", password: '123456')
hannah = User.create!(email: "hannah.meyer@gmail.com", password: '123456')
fritz = User.create!(email: "fritz.meyer@gmail.com", password: '123456')
ida = User.create!(email: "ida.meyer@gmail.com", password: '123456')
lotta = User.create!(email: "lotta.meyer@gmail.com", password: '123456')


hot = Restaurant.create!(name: 'Hot', address: 'Weezer Strasse 6', city:'Düsseldorf')
monkeys = Restaurant.create!(name: 'monkeys', address: 'Weezer Strasse 6', city:'Düsseldorf')
saitta = Restaurant.create!(name: 'Saitta', address: 'Weezer Strasse 6', city:'Düsseldorf')
fratelli = Restaurant.create!(name: 'Fratelli', address: 'Weezer Strasse 6', city:'Hamburg')

hannah_rating_1 = Rating.create!(
  header: "Very good restaurant",
  description: "this is a great restaurant and i can highly recommend it!!",
  atmosphere: "chilled",
  stars: '3',
  user: hannah,
  restaurant: hot)

hannah_rating_2 = Rating.create!(
  header: "Very good restaurant",
  description: "this is a great restaurant and i can highly recommend it!!",
  atmosphere: "chilled",
  stars: '3',
  user: hannah,
  restaurant: fratelli)

fritz_rating_1 = Rating.create!(
  header: "Very good restaurant",
  description: "this is a great restaurant and i can highly recommend it!!",
  atmosphere: "chilled",
  stars: '3',
  user: fritz,
  restaurant: saitta)

ida_rating_1 = Rating.create!(
  header: "Very good restaurant",
  description: "this is a great restaurant and i can highly recommend it!!",
  atmosphere: "chilled",
  stars: '3',
  user: ida,
  restaurant: monkeys)

friendship_lina_1 = Friendship.create!(
  status: "accepted",
  user: lina,
  friend: hannah)

friendship_lina_2 = Friendship.create!(
  status: "accepted",
  user: lina,
  friend: fritz)









