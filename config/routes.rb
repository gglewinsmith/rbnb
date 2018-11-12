Rails.application.routes.draw do

  devise_for :users
  resources :devices do
    resources :booking, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
