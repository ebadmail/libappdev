require 'sidekiq/web'

Rails.application.routes.draw do
  resources :books do
    member do
      put "add", to: "books#library"
      put "remove", to: "books#library"
    end
  end
  resources :library, only:[:index]
  resources :pricing, only:[:index]
  devise_for :users, controllers: { registrations: "registrations" }  do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: 'books#index'
  resources :subscriptions
end
