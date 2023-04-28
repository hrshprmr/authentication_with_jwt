Rails.application.routes.draw do
  get 'posts/index'
  post 'posts/create'
  get 'sessions/new'
  # get 'sessions/login'
  get 'sessions/destroy'
  get 'users/new'
  get 'users/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  post '/signup', to: 'users#signup'
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#destroy'

  get '/posts', to: 'posts#index'
end
