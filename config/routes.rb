
Rails.application.routes.draw do
  devise_for :users
  # Define the root path route ("/")
  root to: 'places#index'

  

  resources :entries
  resources :places
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:show, :edit, :update]
end