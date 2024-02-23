Rails.application.routes.draw do
  devise_for :users
  
  resources :trips do
    resources :plans
    collection do
      get 'search'
    end
  end
  
  root to: 'trips#index'

end
