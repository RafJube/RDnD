Rails.application.routes.draw do
  root to: 'ducks#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :ducks do
    resources :rentals
  end
end
