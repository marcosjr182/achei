# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1...10).each do |i|
  place = Place.create(name: "IMD #{i}", longitude: 40.7127837 , latitude:-74.0059413)
  Item.create(name: "Objeto Voador #{i}", place: place, category:"celular")
end