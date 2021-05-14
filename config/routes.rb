Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  post '/login', to: 'users#login'
  resources :posts
end
