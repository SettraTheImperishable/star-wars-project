class CreateSpecies < ActiveRecord::Migration[6.0]
  def change
    create_table :species do |t|
      t.string :classification
      t.string :designation
      t.string :average_height
      t.string :average_lifespan
      t.string :eye_colors
      t.string :hair_colors
      t.string :skin_colors
      t.references :planet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
