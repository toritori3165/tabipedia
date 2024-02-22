Rails.application.routes.draw do
  devise_for :users
  
  resources :trips do
    resources :plans
  end
  
  root to: 'trips#index'

end
