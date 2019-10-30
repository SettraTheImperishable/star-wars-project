# frozen_string_literal: true

class StarshipsController < ApplicationController
  def index
    @starships = Starship.all
  end

  def show; end
end
