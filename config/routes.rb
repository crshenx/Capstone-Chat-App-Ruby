Rails.application.routes.draw do
  resources :avatar_images
  namespace :api do
    namespace :v1 do
      resources :messages
      resources :users #, only: [:create]
      resources :rooms
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/rooms', to: 'rooms#index'
      post '/rooms', to: 'rooms#create'
      # I am adding this although we may not need with consumer creation
      # mount ActionCable.server => '/cable'
    end
  end
end
