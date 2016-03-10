# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'ffaker'

100.times do |index|
  Photo.create(username: "username-#{index}", caption: FFaker::Name.name,
               url: "http://lorempixel.com/400/400/", likes_count: index)
end

Photo.all.each do |photo|
  rand(100).times do |index|
    photo.comments << Comment.new(name: "username-#{index}", description: FFaker::CompanyIT.name)
  end
end
