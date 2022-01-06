Rails.application.routes.draw do
  root to: "books#index"

  devise_for :users

  resources :cart_items
  resource :orders, only: :create

  resources :books do
    resources :cart_items, only: :create
  end

  namespace :admin do
    resources :users
  end
end
