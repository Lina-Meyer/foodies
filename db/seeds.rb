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

lina = User.create!(email: "lina.meyer@gmail.com", first_name: 'Lina', last_name:'Meyer', password: '123456',  remote_photo_url: 'http://res.cloudinary.com/linameyer/image/upload/v1528448332/Linaneu.jpg')
hannah = User.create!(email: "hannah.meyer@gmail.com", first_name: 'Hannah', last_name:'Meyer', password: '123456', remote_photo_url: 'http://res.cloudinary.com/linameyer/image/upload/v1528446361/jpps8irsv9j6tvz9ltnp.jpg')
fritz = User.create!(email: "fritz.meyer@gmail.com", first_name: 'Fritz', last_name:'Meyer', password: '123456', remote_photo_url: 'http://res.cloudinary.com/linameyer/image/upload/v1528461064/dmhqc5fdjc3gxd6k6tr0.jpg')
ida = User.create!(email: "ida.meyer@gmail.com", first_name: 'Ida', last_name:'Meyer', password: '123456', remote_photo_url: 'http://res.cloudinary.com/linameyer/image/upload/v1528273896/lxnuzsujkapxqt3kbrqk.jpg')
lotta = User.create!(email: "lotta.meyer@gmail.com", first_name: 'Lotta', last_name:'Meyer', password: '123456',remote_photo_url: 'http://res.cloudinary.com/linameyer/image/upload/v1527242741/mexyfhwzqesywdqibhpv.jpg')


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









