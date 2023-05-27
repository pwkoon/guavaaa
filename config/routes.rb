Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users
    root to: "pages#home"
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
