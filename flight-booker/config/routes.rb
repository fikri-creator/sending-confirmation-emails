Rails.application.routes.draw do
  root 'flights#index'

  resources :flights, only: [:index] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:show]

  get 'up' => 'rails/health#show', as: :rails_health_check
end
