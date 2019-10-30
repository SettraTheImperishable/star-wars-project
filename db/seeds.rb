# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

CharacterStarship.destroy_all
CharacterSpecy.destroy_all
Starship.destroy_all
Species.destroy_all
Character.destroy_all
Planet.destroy_all

response = Swapi.get_all 'planets'
planets = JSON.parse(response)
planet_count = planets['count']
i = 1

while i <= planet_count
  response = Swapi.get_planet i
  planet = JSON.parse(response)
  Planet.create(
    name: planet['name'],
    rotation_period: planet['rotation_period'],
    orbital_period: planet['orbital_period'],
    diameter: planet['diameter'],
    climate: planet['climate'],
    gravity: planet['gravity'],
    terrain: planet['terrain'],
    surface_water: planet['surface_water'],
    population: planet['population']
  )
  i += 1
end
