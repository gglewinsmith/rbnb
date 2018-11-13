Rails.application.routes.draw do

  devise_for :users
  get 'pages/homepage', to: 'pages#homepage', as: 'homepage'
  get 'pages/dashboard', to: 'pages#dashboard', as: 'dashboard'

  resources :devices do
    resources :bookings, only: [:new, :create]
  end

  root to: 'pages#homepage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
