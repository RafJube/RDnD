# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Duck.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?
Skill.destroy_all if Rails.env.development?

require "open-uri"

Skill.create!(
  name: "Python"
)

Skill.create!(
  name: "Ruby"
)

Skill.create!(
  name: "Javascript"
)

User.create!(
  username: "king1",
  email: "king1@lewagon.com",
  password: "secret"
)

file = URI.open('https://res.cloudinary.com/guilhem/image/upload/v1653396832/RDnD/Ducktrix-rubber-duck-front-Amsterdam-Duck-Store-1_li4gsh.jpg')
cocoduck = Duck.new(user_id: 1, name: 'Coco', description: "A great duck, the best one to help you on cloudinary tool!", price: "50", skills: "Javascript")
cocoduck.photo.attach(io: file, filename: 'coco.png', content_type: 'image/png')
cocoduck.save!

file = URI.open('https://res.cloudinary.com/guilhem/image/upload/v1653396867/RDnD/Bohemian-Quacksody-rubber-duck-front-Amsterdam-Duck-Store-e1570195237919-400x400_i9qm1u.jpg')
bohemian = Duck.create!(user_id: 1, name: 'Bohemian', description: "A great duck, the best one to help you !", price: "34", skills: "Ruby")
bohemian.photo.attach(io: file, filename: 'bohemian.png', content_type: 'image/png')

file = URI.open('https://res.cloudinary.com/guilhem/image/upload/v1653397075/RDnD/Duck-You-rubber-duck-front-Amsterdam-Duck-Store-400x400_rnqxsc.jpg')
duck_you = Duck.create!(user_id: 1, name: 'Duck You', description: "A great duck, the best one to help you !", price: "60", skills: "Ruby")
duck_you.photo.attach(io: file, filename: 'duckyou.png', content_type: 'image/png')

file = URI.open('https://res.cloudinary.com/guilhem/image/upload/v1653397097/RDnD/Black-Sheep-Rubber-Duck-front-Amsterdam-Duck-Store-400x400_ecdhq2.jpg')
black_sheep = Duck.create!(user_id: 1, name: 'Black Sheep', description: "A great duck, the best one to help you !", price: "70", skills: "Ruby")
black_sheep.photo.attach(io: file, filename: 'blacksheep.png', content_type: 'image/png')

file = URI.open('https://res.cloudinary.com/guilhem/image/upload/v1653397097/RDnD/Black-Sheep-Rubber-Duck-front-Amsterdam-Duck-Store-400x400_ecdhq2.jpg')
black_sheep = Duck.create!(user_id: 1, name: 'Black Sheep', description: "A great duck, the best one to help you !", price: "49", skills: "Python")
black_sheep.photo.attach(io: file, filename: 'blacksheep.png', content_type: 'image/png')
