Rails.application.routes.draw do
  devise_for :users

  resources :users, :only => [:show] do
    member do
      post "follow" => "friendships#create"
      delete "unfollow" => "friendships#destroy"
  end
  resources :statuses
  end

  HighVoltage.configure do |config|
    config.home_page = 'home'
  end
  
  resources :cities

  resources :cohorts

  resources :activities, only: [:index]

  get '/search', to: 'searches#show'

  resource :admin_dashboard, only: [:show]

  resources :charges, only: [:new, :create]

  resource :book_downloads, only: [:show]


end
