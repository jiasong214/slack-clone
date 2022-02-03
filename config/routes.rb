Rails.application.routes.draw do
  root to: "channels#index"

  # login, logout
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  # channel routes for membership
  patch '/channels/:channel_id/join' => 'channels#join', as: "join_channel"
  patch '/channels/:channel_id/leave' => 'channels#leave', as: "leave_channel"
  patch '/channels/:channel_id/invite/:user_id' => 'channels#invite', as: "invite_channel"


  resources :users
  resources :channels, param: :channel_id
  # channel id is needed as chats belong to channel
  resources :chats, :path => "channels/:channel_id/chats"
  # user id is needed as DMs belong to user
  resources :dms, :path => "dms/:user_id/chats"
end