Duck.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?
Skill.destroy_all if Rails.env.development?

require "open-uri"

duck_skills = ["CSS", "HTML", "Javascript", "Ruby", "Python"]
duck_skills.each do |skill|
  s = Skill.new
  s.name = skill
  s.save
end

skills = Skill.all

def random_skill(skills)
  array = skills.shuffle
  array[0..rand(0..(array.size - 1))]
end

bob = User.create!(
  username: "king1",
  email: "king1@lewagon.com",
  password: "secret",
  address: "12 rue des rues"
)

bobette = User.create!(
  username: "queen1",
  email: "queen1@lewagon.com",
  password: "secret",
  address: "24 place des maisons"
)

file = URI.open('https://res.cloudinary.com/guilhem/image/upload/v1653396832/RDnD/Ducktrix-rubber-duck-front-Amsterdam-Duck-Store-1_li4gsh.jpg')
cocoduck = Duck.new(
  user_id: bob.id,
  name: 'Coco',
  description: "The original Duck. He knows everything, debugged every bug, wrote every line. If you are stuck on your first Le Wagon exercise, he will help you. He is the One.
  ",
  price: 50,
  average_rating: 4.2
)
cocoduck.skills = random_skill(skills)
cocoduck.photo.attach(io: file, filename: 'coco.png', content_type: 'image/png')
cocoduck.save!

file = URI.open('https://res.cloudinary.com/guilhem/image/upload/v1653396867/RDnD/Bohemian-Quacksody-rubber-duck-front-Amsterdam-Duck-Store-e1570195237919-400x400_i9qm1u.jpg')
bohemian = Duck.new(
  user_id: bobette.id,
  name: 'Bohemian',
  description: "If you Want It All, like any other Dev and you want it now. Bohemian won't let you down. And he knows how to grow a stash !",
  price: 34,
  average_rating: 5.0
)
bohemian.skills = random_skill(skills)
bohemian.photo.attach(io: file, filename: 'bohemian.png', content_type: 'image/png')
bohemian.save

file = URI.open('https://res.cloudinary.com/guilhem/image/upload/v1653397075/RDnD/Duck-You-rubber-duck-front-Amsterdam-Duck-Store-400x400_rnqxsc.jpg')
duck_you = Duck.new(
  user_id: bobette.id,
  name: 'Duck You',
  description: "A Duck of a few words, good listener. He'll tell you if you mess up.",
  price: 60,
  average_rating: 4.0
)
duck_you.photo.attach(io: file, filename: 'duckyou.png', content_type: 'image/png')
duck_you.skills = random_skill(skills)
duck_you.save

file = URI.open('https://res.cloudinary.com/guilhem/image/upload/v1653397097/RDnD/Black-Sheep-Rubber-Duck-front-Amsterdam-Duck-Store-400x400_ecdhq2.jpg')
black_sheep = Duck.new(
  user_id: bob.id,
  name: 'Black Sheep',
  description: "Don't be fooled by its appearance, this is still a coder duck. And a damn good one !",
  price: 70.0,
  average_rating: 4.2
)
black_sheep.photo.attach(io: file, filename: 'blacksheep.png', content_type: 'image/png')
black_sheep.skills = random_skill(skills)
black_sheep.save
