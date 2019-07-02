Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :entries
      resources :plans

      get '/current_user', to: 'auth#show'
      post '/login', to: 'auth#create'

      get '/oauth/callback', to: 'users#stripe_callback'

      post '/charges', to: 'stripes#charges'
      post '/transfers', to: 'stripes#transfers'
    end
  end
end
