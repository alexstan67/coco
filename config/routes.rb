Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :lessons do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :update] do
    get "/accept", to: "bookings#accept"
    get "/reject", to: "bookings#reject"
  end
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
