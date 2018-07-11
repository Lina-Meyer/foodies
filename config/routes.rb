Rails.application.routes.draw do
  devise_for :users
  root to: 'restaurants#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :restaurants, only: [:index, :show, :create] do
    resources :favorites, only: [:create, :destroy]
  end
  resources :ratings, only: [:new, :create]
  resources :friendships, only: [:new]
  resources :users, only: [:show, :edit] do
    resources :friendships, only: [:create, :show, :edit, :update]

  end

end
