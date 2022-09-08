Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :rooms
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/rooms', to: 'rooms#index'
      post '/rooms', to: 'rooms#create'
    end
  end
end
