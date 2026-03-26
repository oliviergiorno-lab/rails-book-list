Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"

  get "rooms", to: "rooms#index", as: "rooms"

  resources :hotels do
    resources :rooms, only: [ :index, :show ] do
      resources :bookings, only: [ :create ]
    end
  end
end
