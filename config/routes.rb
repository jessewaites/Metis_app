Rails.application.routes.draw do
  devise_for :users
    resources :users, :only => [:show]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  HighVoltage.configure do |config|
    config.home_page = 'home'
  end
  
  resources :cities

  resources :cohorts

end
