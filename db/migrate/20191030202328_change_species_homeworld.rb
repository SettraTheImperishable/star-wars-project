# frozen_string_literal: true

class ChangeSpeciesHomeworld < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:species, :planet_id, true)
  end
end
