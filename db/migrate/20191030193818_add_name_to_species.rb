# frozen_string_literal: true

class AddNameToSpecies < ActiveRecord::Migration[6.0]
  def change
    add_column :species, :name, :string
  end
end
