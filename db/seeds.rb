require "open-uri"

puts "Destroy everything..."

Duck.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?
Skill.destroy_all if Rails.env.development?

puts "Done"
puts "-------------------------"
puts "Creating Skills..."

duck_skills = ["CSS", "HTML", "Javascript", "Ruby", "Python"]
duck_skills.each do |skill|
  s = Skill.new
  s.name = skill
  s.save
end
skills = Skill.all

puts "Done"
puts "-------------------------"
puts "Creating Users..."

bob = User.create!(
  username: "king1",
  email: "king1@lewagon.com",
  password: "secret",
  address: "Paris"
)
  
bobette = User.create!(
  username: "queen1",
  email: "queen1@lewagon.com",
  password: "secret",
  address: "Bordeaux"
)
    
yoyo = User.create!(
  username: "tatayoyo",
  email: "tata@yoyo.fr",
  password: "secret",
  address: "Lyon"
)

def random_skill(skills)
  array = skills.shuffle
  array[0..rand(0..(array.size - 1))]
end
      
def create_a_duck(hash={}, skills)
  file = URI.open(hash[:url])
  cloud = Cloudinary::Uploader.upload(hash[:url])
  duck = Duck.new(
    user_id: hash[:user].id,
    name: hash[:name],
    description: Faker::TvShows::HowIMetYourMother.catch_phrase,
    price: rand(1..1000),
    average_rating: rand(0..5)
  )
  duck.skills = random_skill(skills)
  duck.photo.attach(io: file, filename: "#{hash[:name]}.png", content_type: 'image/png')
  duck.save!
end

puts "Done"
puts "-------------------------"
puts "Creating Ducks..."

array = [
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653396832/RDnD/Ducktrix-rubber-duck-front-Amsterdam-Duck-Store-1_li4gsh.jpg",
    name: "Ducktrix",
    user: bob
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653396867/RDnD/Bohemian-Quacksody-rubber-duck-front-Amsterdam-Duck-Store-e1570195237919-400x400_i9qm1u.jpg",
    name: "Bohemian",
    user: bobette
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397075/RDnD/Duck-You-rubber-duck-front-Amsterdam-Duck-Store-400x400_rnqxsc.jpg",
    name: "Duck_You",
    user: yoyo
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397097/RDnD/Black-Sheep-Rubber-Duck-front-Amsterdam-Duck-Store-400x400_ecdhq2.jpg",
    name: "Black_Sheep",
    user: bobette
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397119/RDnD/cow-black-and-white-rubber-duck-front-e1569759638189-400x400_yrumpf.jpg",
    name: "Cow",
    user: bob
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397134/RDnD/Snail-Rubber-Duck-front-Amsterdam-Duck-Store-510x510_uvu4rj.jpg",
    name: "Snail",
    user: yoyo
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397163/RDnD/Barkeeper-rubber-duck-front-Amsterdam-Duck-Store-400x400_mftn7u.jpg",
    name: "Barkeeper",
    user: bob
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397183/RDnD/Fitness-Holdy-Rubber-Duck-front-Amsterdam-Duck-Store-400x400_tmv9o7.jpg",
    name: "Fitness",
    user: bobette
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397205/RDnD/racer-rubber-duck-front-e1569491413329-400x400_cpmx5g.jpg",
    name: "Racer",
    user: yoyo
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397364/RDnD/black-star-rubber-duck-front-510x510_h3eqlk.jpg",
    name: "Vador",
    user: bob
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397394/RDnD/unicorn-costume-rubber-duck-front-II-400x400_ssendw.jpg",
    name: "Unicorn",
    user: bobette
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397407/RDnD/Finger-Rubber-Duck-Amsterdam-Duck-Store_jd5y4m.jpg",
    name: "Respect_First",
    user: yoyo
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397427/RDnD/Eskimo-with-baby-rubber-duck-front-Amsterdam-Duck-Store_qcupo4.jpg",
    name: "Eskimo",
    user: bob
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397444/RDnD/Ziggy-Starduck-rubber-duck-front-Amsterdam-Duck-Store-1-400x400_idvd3o.jpg",
    name: "Ziggy",
    user: bobette
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397464/RDnD/liberty-rubber-duck-front-e1569407748113-400x400_qphvpg.jpg",
    name: "Liberty",
    user: yoyo
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397524/RDnD/dark-rubber-duck-front-Amsterdam-Duck-Store-400x400_uvjxzx.jpg",
    name: "Dark_Duck_Returns",
    user: bob
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397541/RDnD/Avatara-rubber-duck-front-Amsterdam-Duck-Store-400x400_lef8co.jpg",
    name: "Avatar",
    user: bobette
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397561/RDnD/Rock-idol-rubber-duck-Amsterdam-Duck-Store--510x510_arjdda.png",
    name: "Duck_à_chien",
    user: yoyo
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397659/RDnD/Sparta-rubber-duck-front-Amsterdam-Duck-Store-400x400_ohdmvw.jpg",
    name: "Kratos",
    user: bob
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397685/RDnD/Royal-Guard-rubber-duck-front-Amsterdam-Duck-Store-400x400_dl0vri.jpg",
    name: "Dont_move",
    user: bobette
  },
]

array.each do |hash|
  create_a_duck(hash, skills)
end

# file = URI.open("https://res.cloudinary.com/guilhem/image/upload/v1653397685/RDnD/Royal-Guard-rubber-duck-front-Amsterdam-Duck-Store-400x400_dl0vri.jpg")
# p file
# # cloud = Cloudinary::Uploader.upload(hash[:url])
# duck = Duck.new(
#   user_id: bob.id,
#   name: "blop",
#   description: Faker::TvShows::HowIMetYourMother.catch_phrase,
#   price: rand(1.0..1000.0),
#   average_rating: rand(0.0..5.0)
# )
# duck.skills = random_skill(skills)
# byebug
# duck.photo.attach(io: file, filename: 'blop.png', content_type: 'image/png')
# duck.save!

puts "All Good Boys"
puts "-------------------------"
