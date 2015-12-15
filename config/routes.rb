Rails.application.routes.draw do
  get 'sessions/new'

  root 'home#index'
  resources :users, only: [:index, :new, :show, :edit, :update, :destroy]
  get    'signup'            => 'users#new'
  post   'signup'            => 'users#create'
  get   'instagram-signup'   => 'users#instagram_create'
  get    'login'             => 'sessions#new'
  post   'login'             => 'sessions#create'
  get    'logout'            => 'sessions#destroy'
end
