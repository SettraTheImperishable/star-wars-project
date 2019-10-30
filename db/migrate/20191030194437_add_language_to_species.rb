# frozen_string_literal: true

class AddLanguageToSpecies < ActiveRecord::Migration[6.0]
  def change
    add_column :species, :language, :string
  end
end
