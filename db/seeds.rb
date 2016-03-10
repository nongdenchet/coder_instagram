# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'ffaker'

images = [
    "https://i.ytimg.com/vi/u1w7zqbBiXM/maxresdefault.jpg",
    "http://www.bonappetit.com/wp-content/uploads/2013/08/grilled-ratatouille-salad-646.jpeg",
    "http://app.cookingmatters.org/sites/default/files/sos-img/Ratatouille.jpg",
    "http://www.seriouseats.com/recipes/assets_c/2013/09/20130922-266596-sunday-brunch-ratatouille-fried-eggs-thumb-625xauto-352893.jpg"
]

100.times do |index|
  Photo.create(username: "username-#{index}", caption: FFaker::Name.name,
               url: images[rand(4)], likes_count: index)
end

Photo.all.each do |photo|
  rand(10).times do |index|
    photo.comments << Comment.new(name: "username-#{index}", description: FFaker::CompanyIT.name)
  end
end
