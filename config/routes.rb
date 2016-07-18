Rails.application.routes.draw do
  resources :settings, only: [:index, :edit, :update]
  resources :loans
  resources :users
  resources :books

  root 'books#index'
end
