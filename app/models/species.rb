# frozen_string_literal: true

class Species < ApplicationRecord
  belongs_to :planet

  has_many :character_species
end
