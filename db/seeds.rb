# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.create(name: "Achados")
Category.create(name: "Perdidos")
Category.create(name: "Venda")
Category.create(name: "Aluguel")
Category.create(name: "Doação")

(1...10).each do |i|
  place = Place.create(name: "IMD #{i}", latitude:-5.8325565, longitude: -35.205342 )
  Item.create(name: "Objeto Voador #{i}", place: place)
end

User.create(name: "Usuario", email: "admin@admin.com", password: "adminadmin")
