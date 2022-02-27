Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :teams
  resources :units
  # Defines the root path route ("/")
  root "home#index"
  # get 'home/index'
end
