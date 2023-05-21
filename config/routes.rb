Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root to: "pages#home"
    devise_for :users

    get 'carts', to: 'carts#show'
    post 'carts/add_in_product'
    post 'carts/add_in_cart'
    post 'carts/remove'

    resources :products
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    # root "articles#index"
    resources :orders, only: [:show, :create] do
      resources :payments, only: :new
    end
    resources :contacts, only: [:new, :create]
    resources :reviews, only: [:index, :create]
  end
end
