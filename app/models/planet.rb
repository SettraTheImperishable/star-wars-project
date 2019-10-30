# frozen_string_literal: true

class Planet < ApplicationRecord
  has_many :characters

  validates :name, presences: true
end
