Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products, only: [:index, :show, :new, :create]
  resources :reviews, only: [:index, :create]
  resources :places, only: [:index, :new]
end
