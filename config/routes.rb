Rails.application.routes.draw do
  get 'dashboard' => 'dashboard#index', as: :dashboard
  post 'dashboard/submit_checkout' => 'dashboard#submit_checkout', as: :submit_checkout_dashboard
  post 'dashboard/submit_return' => 'dashboard#submit_return', as: :submit_return_dashboard

  resources :settings, only: [:index, :edit, :update]
  resources :loans
  resources :users
  resources :books

  root 'dashboard#index'
end
