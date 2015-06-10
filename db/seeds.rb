# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tags = ["achados", "perdidos", "venda", "aluguel","doação"]

User.create(name: "Usuario", email: "admin@admin.com", password: "adminadmin")
User.create(name: "Usuario1", email: "adminaaa@admin.com", password: "admaainadmin")

(1...15).each do |i|
  place = Place.create(name: "IMD #{i}", latitude:-5.8325565, longitude: -35.205342 )
  item = Item.create(name: "Objeto Voador #{i}", place: place, user: User.last,description: "Descrição do anuncio")
  item.tag_list.add(tags[Random.new.rand(0..4)])
  item.save
end
