Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    devise_for :users
    root to: "pages#home"
    mount StripeEvent::Engine, at: '/stripe-webhooks'
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
