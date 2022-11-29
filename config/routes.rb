Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :messages
      resources :users #, only: [:create]
      resources :rooms
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/rooms', to: 'rooms#index'
      post '/rooms', to: 'rooms#create'
      post '/attach', to: 'users#attach'
      # delete '/messages', to: 'messages#destroy'
      # I am adding this although we may not need with consumer creation
      delete '/rooms', to: 'rooms#destroy'
      mount ActionCable.server => '/cable'
    end
  end
  get '*path',
  to: 'fallback#index',
  constraints: ->(req) { !req.xhr? && req.format.html? }
end
