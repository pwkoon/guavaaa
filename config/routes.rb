Rails.application.routes.draw do
  devise_for :users

  get 'cart', to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'

  # root to: "pages#home"
  resources :products
  root 'products#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :contacts, only: [:new, :create]
  resources :reviews, only: [:index, :create]
  resources :places, only: [:index, :new]
end
