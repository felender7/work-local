require 'sidekiq/web'

Rails.application.routes.draw do


  resources :referrals
  get 'service_provider', to: 'service_provider#index' ,   via: 'get'
  get '/service_provider/:id', to: 'service_provider#show' ,   via: 'get'
  get 'summary', to: 'summary#show'

  resources :about do
    collection do
      get 'register_online', to: 'about#register_online'
      get 'job_placement',to:'about#job_placement'
      get 'verification', to:'about#verification'
    end
  end

  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'
  resources :find_jobs do
   collection do
     get :autocomplete
   end
 end

  resources :users, :only =>[:show] do
    resources :reviews, except: [:show]
  end

  resources :jobs
  resources :company_details
  resources :cvs
  resources :charges
  resources :documents
  namespace :admin do
      resources :users
      resources :announcements
      resources :notifications
      resources :services

      root to: "users#index"
    end
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users,:path_prefix => 'd'
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
