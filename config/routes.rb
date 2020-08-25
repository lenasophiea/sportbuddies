Rails.application.routes.draw do
  devise_for :users
  root to: 'sports#index'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :sports, only: [:index,:show] do
      resources :buddy_requests, only: [:new, :create] do
      end
    end
end
