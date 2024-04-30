Rails.application.routes.draw do
  devise_for :users

  resources :trips do
    resources :plans do
      resources :plan_comments, only: :create
    end
    resources :trip_comments, only: :create
    collection do
      get 'search'
    end
  end

  root to: 'trips#index'

  resources :users, only: [:show, :edit, :update, :destroy]
end
