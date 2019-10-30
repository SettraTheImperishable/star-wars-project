Rails.application.routes.draw do
  get 'starships/index'
  get 'starships/show'
  get 'species/index'
  get 'species/show'
  get 'characters/index'
  get 'characters/show'
  get 'planets/index'
  get 'planets/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
