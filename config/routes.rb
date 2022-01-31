Rails.application.routes.draw do
  root to: 'chats#index'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/channels/:id/join' => 'channel#join'

  resources :users
  resources :channels
  resources :chats
end
