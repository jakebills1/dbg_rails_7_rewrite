baritone = Guitar.create(name: "Baritone", price: 2000.0, description: "Long scale baritone guitar made with exotic wood", year: [*2000..2019].sample)
# baritone.pictures.create(url: "https://i.imgur.com/L0mDhqI.jpg")
# baritone.pictures.create(url: "https://i.imgur.com/0Z9bAUf.jpg")
# baritone.pictures.create(url: "https://i.imgur.com/V0pwiG3.jpg")

guitar_names = ["Archtop", "Auditorium", "Cigar-box", "Resonator", "Jumbo", "Bass", "Martin style", "Parlor", "Classical", "Dreadnought"]
guitar_names.each do |guitar_name|
  g = Guitar.create(name: guitar_name, price: 2450.0, description: Faker::Lorem.sentence, year: [*2000..2019].sample)
  # g.pictures.create(url: Faker::LoremFlickr.image("300x300", ['#{g.name}']))
  # g.pictures.create(url: Faker::LoremFlickr.image("300x300", ['#{g.name}']))
  # g.pictures.create(url: Faker::LoremFlickr.image("300x300", ['#{g.name}']))
end