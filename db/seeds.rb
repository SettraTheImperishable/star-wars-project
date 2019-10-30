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

# grabs all the planets, loops through each page url
response = Swapi.get_all 'planets'
planets = JSON.parse(response)
planet_list = planets['results']
isNextPage = true

while isNextPage
  uri = URI(planets['next'])
  response = Net::HTTP.get(uri)
  planets = JSON.parse(response)
  planet_list += planets['results']

  break if planets['next'].nil?
end

# grabs all starships, loops through each page url
response = Swapi.get_all 'starships'
starships = JSON.parse(response)
starship_list = starships['results']

while isNextPage
  uri = URI(starships['next'])
  response = Net::HTTP.get(uri)
  starships = JSON.parse(response)
  starship_list += starships['results']

  break if starships['next'].nil?
end

# grabs all species, loops through each page url
response = Swapi.get_all 'species'
species = JSON.parse(response)
species_list = species['results']

while isNextPage
  uri = URI(species['next'])
  response = Net::HTTP.get(uri)
  species = JSON.parse(response)
  species_list += species['results']

  break if species['next'].nil?
end

planet_list.each do |planet|
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
end

# creates all Starship data
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

species_list.each do |specy|
  uri = URI(specy['homeworld'])
  response = Net::HTTP.get(uri)
  planet = JSON.parse(response)

  homeworld = Planet.find_by name: planet['name']

  homeworld.species
           .build(
             # name: specy['name']
             classification: specy['classification'],
             designation: specy['designation'],
             average_height: specy['average_height'],
             skin_colors: specy['skin_colors'],
             hair_colors: specy['hair_colors'],
             eye_colors: specy['eye_colors'],
             average_lifespan: specy['average_lifespan'],
             language: specy['language']
           ).save
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
