Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  match '/users',   to: 'users#index',   via: 'get'
  resources :teams
  resources :units
  # Defines the root path route ("/")
  root "home#index"
  # get 'home/index'
end
