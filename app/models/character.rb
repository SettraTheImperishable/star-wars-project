# frozen_string_literal: true

class Character < ApplicationRecord
  belongs_to :planet

  has_many :character_species
  has_many :character_starships

  validates :name, presence: true
end
