Rails.application.routes.draw do
  resources :trips do
    resources :plans
  end
  
  root to: 'trips#index'
end
