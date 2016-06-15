Rails.application.routes.draw do

  get 'genres/index'

  get 'genres/show'

  resources :artists
  resources :songs
  resources :genres

  root "artists#index"

end
