class CreateStarships < ActiveRecord::Migration[6.0]
  def change
    create_table :starships do |t|
      t.string :name
      t.string :model
      t.string :manufacturer
      t.string :credit_cost
      t.string :length
      t.string :max_atmosphere_speed
      t.string :crew
      t.string :passengers
      t.string :cargo_capacity
      t.string :consumables
      t.string :hyperdrive_rating
      t.string :MGLT
      t.string :starship_class

      t.timestamps
    end
  end
end
