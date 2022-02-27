Rails.application.routes.draw do
  resources :teams
  resources :units
  # Defines the root path route ("/")
  root "home#index"
  # get 'home/index'
end
