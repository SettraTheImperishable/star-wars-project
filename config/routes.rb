# frozen_string_literal: true

Rails.application.routes.draw do
  get '/starships', to: 'starships#index'
  get '/starships/:id', to: 'starships#show', id: /\d+/

  get '/species', to: 'species#index'
  get '/species/:id', to: 'species#show', id: /\d+/

  get '/characters', to: 'characters#index'
  get '/characters/:id', to: 'characters#show', id: /\d+/

  get '/planets', to: 'planets#index'
  get '/planets/:id', to: 'planets#show', id: /\d+/

  root to: 'planets#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
