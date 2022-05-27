require "open-uri"

puts "Destroy everything..."

Rental.destroy_all if Rails.env.development?
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

def random_skill(skills)
  array = skills.shuffle
  array[0..rand(0..(array.size - 1))]
end

def create_user(name, address)
  User.create!(
    username: name,
    email: "#{name}@lewagon.com",
    password: "secret",
    address: address
  )
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

un = create_user("king1", "Paris")
deux = create_user("queen1", "Bordeaux")
trois = create_user("tatayoyo", "Bayonne")
quatre = create_user("bob4", "Lyon")
cinq = create_user("bob5", "Strasbourg")
six = create_user("bob6", "Lille")
sept = create_user("bob7", "Brest")
huit = create_user("bob8", "Marseille")
neuf = create_user("bob9", "Grenoble")
dix = create_user("bob10", "Nanterre")
onze = create_user("bob11", "Le Porge")
douze = create_user("bob12", "Biscarosse")
treize = create_user("bob13", "Tours")
quatorze = create_user("bob14", "Limoges")
quinze = create_user("bob15", "Clermont-Ferrand")


puts "Done"
puts "-------------------------"
puts "Creating Ducks..."

array = [
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653396832/RDnD/Ducktrix-rubber-duck-front-Amsterdam-Duck-Store-1_li4gsh.jpg",
    name: "Ducktrix",
    user: un
  },
  {
    url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShp85UBEy6ros9OG9hdweM9qQGezparGMSZA&usqp=CAU",
    name: "Mandarin",
    user: quatorze
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653396867/RDnD/Bohemian-Quacksody-rubber-duck-front-Amsterdam-Duck-Store-e1570195237919-400x400_i9qm1u.jpg",
    name: "Bohemian",
    user: deux
  },
  {
    url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdAyk7Spm4N1Zn7AXFmK-4f49t44QGNzf_7A&usqp=CAU",
    name: "Averell",
    user: quatorze
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397075/RDnD/Duck-You-rubber-duck-front-Amsterdam-Duck-Store-400x400_rnqxsc.jpg",
    name: "Duck_You",
    user: trois
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397097/RDnD/Black-Sheep-Rubber-Duck-front-Amsterdam-Duck-Store-400x400_ecdhq2.jpg",
    name: "Black_Sheep",
    user: quatre
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397119/RDnD/cow-black-and-white-rubber-duck-front-e1569759638189-400x400_yrumpf.jpg",
    name: "Cow",
    user: cinq
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397134/RDnD/Snail-Rubber-Duck-front-Amsterdam-Duck-Store-510x510_uvu4rj.jpg",
    name: "Snail",
    user: six
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397163/RDnD/Barkeeper-rubber-duck-front-Amsterdam-Duck-Store-400x400_mftn7u.jpg",
    name: "Barkeeper",
    user: sept
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397183/RDnD/Fitness-Holdy-Rubber-Duck-front-Amsterdam-Duck-Store-400x400_tmv9o7.jpg",
    name: "Fitness",
    user: huit
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397364/RDnD/black-star-rubber-duck-front-510x510_h3eqlk.jpg",
    name: "Vador",
    user: dix
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397394/RDnD/unicorn-costume-rubber-duck-front-II-400x400_ssendw.jpg",
    name: "Unicorn",
    user: onze
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397407/RDnD/Finger-Rubber-Duck-Amsterdam-Duck-Store_jd5y4m.jpg",
    name: "Respect_First",
    user: douze
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397427/RDnD/Eskimo-with-baby-rubber-duck-front-Amsterdam-Duck-Store_qcupo4.jpg",
    name: "Eskimo",
    user: un
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397444/RDnD/Ziggy-Starduck-rubber-duck-front-Amsterdam-Duck-Store-1-400x400_idvd3o.jpg",
    name: "Ziggy",
    user: deux
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397464/RDnD/liberty-rubber-duck-front-e1569407748113-400x400_qphvpg.jpg",
    name: "Liberty",
    user: trois
  },
  {
    url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6D1CI0U3FiSNCXfU_3yQ0kEFUdBJWTim7Uw&usqp=CAU",
    name: "William",
    user: quinze
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397524/RDnD/dark-rubber-duck-front-Amsterdam-Duck-Store-400x400_uvjxzx.jpg",
    name: "Dark_Duck_Returns",
    user: trois
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397541/RDnD/Avatara-rubber-duck-front-Amsterdam-Duck-Store-400x400_lef8co.jpg",
    name: "Avatar",
    user: trois
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397561/RDnD/Rock-idol-rubber-duck-Amsterdam-Duck-Store--510x510_arjdda.png",
    name: "Duck_à_chien",
    user: un
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397659/RDnD/Sparta-rubber-duck-front-Amsterdam-Duck-Store-400x400_ohdmvw.jpg",
    name: "Kratos",
    user: deux
  },
  {
    url: "https://res.cloudinary.com/guilhem/image/upload/v1653397685/RDnD/Royal-Guard-rubber-duck-front-Amsterdam-Duck-Store-400x400_dl0vri.jpg",
    name: "Dont_move",
    user: dix
  },
  {
    url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShp85UBEy6ros9OG9hdweM9qQGezparGMSZA&usqp=CAU",
    name: "Mandarin",
    user: quatorze
  },
  {
    url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9OBlQ5Gy6NQggpI4bN984l-2qa8oiaLzT4g&usqp=CAU",
    name: "Joe",
    user: dix
  },
  {
    url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_uNcvT9wLDf7eM-vE1mk6E1OYSiV6wDqDWg&usqp=CAU",
    name: "Alfred",
    user: treize
  },
  {
    url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdAyk7Spm4N1Zn7AXFmK-4f49t44QGNzf_7A&usqp=CAU",
    name: "Averell",
    user: quatorze
  },
  {
    url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6D1CI0U3FiSNCXfU_3yQ0kEFUdBJWTim7Uw&usqp=CAU",
    name: "William",
    user: quinze
  }
]

array.each do |hash|
  create_a_duck(hash, skills)
end

puts "All Good Boys"
puts "-------------------------"
