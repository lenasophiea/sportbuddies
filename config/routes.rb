Rails.application.routes.draw do
  devise_for :users
  root to: 'sports#index'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    resources :sports, only: [:index, :show] do
      resources :buddy_requests, only: :create
      resources :favorite_sports, only: [ :new, :create ]

  end
  resources :buddy_requests, only: :show do
    resources :profiles, only: :show do
      resources :conversations, only: :create
    end
  end
  resources :conversations, only: [:index, :show] do
    resources :messages, only: :create
  end

  resources :favorite_sports, only: [ :destroy ]

end
