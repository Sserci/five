# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Field.destroy_all

Field.create(name: "Massalia Foot Indoor 2", address: "31 Bd Charles Moretti, 13014 Marseille")
Field.create(name: "FOOT INDOOR Marseille", address: "Montee Commandant de Robien, 13011 Marseille")
Field.create(name: "Le 13 by Puma", address: "18 Bd Frédéric Sauvage, 13014 Marseille")


