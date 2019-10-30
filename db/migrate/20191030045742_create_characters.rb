class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :mass
      t.string :height
      t.string :eye_color
      t.string :hair_color
      t.string :skin_color
      t.string :gender
      t.string :birth_year
      t.references :planet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
