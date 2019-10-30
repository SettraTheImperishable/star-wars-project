# frozen_string_literal: true

class Planet < ApplicationRecord
  has_many :characters
  has_many :species

  validates :name, presence: true
end
