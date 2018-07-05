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

lina = User.create!(email: "lina.meyer@gmail.com", first_name: 'Lina', last_name:'Meyer', password: '123456',  remote_photo_url: 'https://res.cloudinary.com/linameyer/image/upload/v1528372666/Lina.jpg')
hannah = User.create!(email: "hannah.meyer@gmail.com", first_name: 'Hannah', last_name:'Meyer', password: '123456', remote_photo_url: 'http://res.cloudinary.com/linameyer/image/upload/v1529260082/vn7ghcnxvl6agc0sanjd.jpg')
fritz = User.create!(email: "fritz.meyer@gmail.com", first_name: 'Fritz', last_name:'Meyer', password: '123456', remote_photo_url: 'http://res.cloudinary.com/linameyer/image/upload/v1528376862/vsds72miiiqbsmpjmkap.jpg')
ida = User.create!(email: "ida.meyer@gmail.com", first_name: 'Ida', last_name:'Meyer', password: '123456', remote_photo_url: 'http://res.cloudinary.com/linameyer/image/upload/v1526740996/x9arckfabiyiwh2hstsv.jpg')
lotta = User.create!(email: "lotta.meyer@gmail.com", first_name: 'Lotta', last_name:'Meyer', password: '123456',remote_photo_url: 'http://res.cloudinary.com/linameyer/image/upload/v1526740996/x9arckfabiyiwh2hstsv.jpg')


hot = Restaurant.create!(name: 'Hot', address: 'Dominikanerstraße 14, 40545 Düsseldorf', city:'Düsseldorf')
monkeys = Restaurant.create!(name: 'Olio', address: 'Schirmerstraße 54, 40211 Düsseldorf', city:'Düsseldorf')
saitta = Restaurant.create!(name: 'Saitta', address: 'Barbarossapl. 3, 40545 Düsseldorf', city:'Düsseldorf')
fratelli = Restaurant.create!(name: 'Peter Pane', address: 'Schäferkampsallee 1, 20357 Hamburg', city:'Hamburg')

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

friendship_hannah_1 = Friendship.create!(
  status: "accepted",
  user: hannah,
  friend: lina)

friendship_lina_2 = Friendship.create!(
  status: "accepted",
  user: lina,
  friend: fritz)

friendship_fritz_2 = Friendship.create!(
  status: "accepted",
  user: fritz,
  friend: lina)









