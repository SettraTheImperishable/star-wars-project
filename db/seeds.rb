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
count = planets['count']
i = 1

while i <= count
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

# seeds Starship data
response = Swapi.get_all 'starships'
starships = JSON.parse(response)
starship_list = starships['results']
isNextPage = true

while isNextPage
  url = starships['next']
  uri = URI(url)
  response = Net::HTTP.get(uri)
  starships = JSON.parse(response)
  starship_list += starships['results']

  break if starships['next'].nil?
end

starship_list.each do |starship|
  Starship.create(
    name: starship['name'],
    model: starship['mode;'],
    manufacturer: starship['manufacturer'],
    credit_cost: starship['cost_in_Credits'],
    length: starship['length'],
    max_atmosphere_speed: starship['max_atmosphering_speed'],
    crew: starship['crew'],
    passengers: starship['passengers'],
    cargo_capacity: starship['cargo_capacity'],
    consumables: starship['consumables'],
    hyperdrive_rating: starship['hyperdrive_rating'],
    MGLT: starship['MGLT'],
    starship_class: starship['starship_class']
  )
end

# response = Swapi.get_all 'people'
# people = JSON.parse(response)
# count = people['count']
# i = 1

# while i <= count
#   response = Swapi.get_person i
#   character = JSON.parse(response)
#   Character.create(
#     name: character['name'],

#   )
#   i += 1
# end
