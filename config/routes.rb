Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  post '/login', to: 'users#login'
  get '/categories', to: 'categories#index'
  resources :posts
end
