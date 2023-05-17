Rails.application.routes.draw do
  devise_for :users

  get 'carts', to: 'carts#show'
  post 'carts/add_in_product'
  post 'carts/add_in_cart'
  post 'carts/remove'

  root to: "pages#home"
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :contacts, only: [:new, :create]
  resources :reviews, only: [:index, :create]
  resources :places, only: [:index, :new]
end
