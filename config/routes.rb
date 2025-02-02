Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    member do
      patch :update_status
    end
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show]
  root 'projects#index'
end