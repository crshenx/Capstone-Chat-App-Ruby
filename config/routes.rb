Rails.application.routes.draw do
  get 'rooms/index'
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :rooms
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
