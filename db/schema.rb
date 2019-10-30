# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_30_202328) do

  create_table "character_species", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "species_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_character_species_on_character_id"
    t.index ["species_id"], name: "index_character_species_on_species_id"
  end

  create_table "character_starships", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "starship_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_character_starships_on_character_id"
    t.index ["starship_id"], name: "index_character_starships_on_starship_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "mass"
    t.string "height"
    t.string "eye_color"
    t.string "hair_color"
    t.string "skin_color"
    t.string "gender"
    t.string "birth_year"
    t.integer "planet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["planet_id"], name: "index_characters_on_planet_id"
  end

  create_table "planets", force: :cascade do |t|
    t.string "name"
    t.string "rotation_period"
    t.string "orbital_period"
    t.string "diameter"
    t.string "climate"
    t.string "gravity"
    t.string "terrain"
    t.string "surface_water"
    t.string "population"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "species", force: :cascade do |t|
    t.string "classification"
    t.string "designation"
    t.string "average_height"
    t.string "average_lifespan"
    t.string "eye_colors"
    t.string "hair_colors"
    t.string "skin_colors"
    t.integer "planet_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "language"
    t.index ["planet_id"], name: "index_species_on_planet_id"
  end

  create_table "starships", force: :cascade do |t|
    t.string "name"
    t.string "model"
    t.string "manufacturer"
    t.string "credit_cost"
    t.string "length"
    t.string "max_atmosphere_speed"
    t.string "crew"
    t.string "passengers"
    t.string "cargo_capacity"
    t.string "consumables"
    t.string "hyperdrive_rating"
    t.string "MGLT"
    t.string "starship_class"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "character_species", "characters"
  add_foreign_key "character_species", "species"
  add_foreign_key "character_starships", "characters"
  add_foreign_key "character_starships", "starships"
  add_foreign_key "characters", "planets"
  add_foreign_key "species", "planets"
end
