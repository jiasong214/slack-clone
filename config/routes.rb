Rails.application.routes.draw do
  root to: "channels#index"

  # login, logout
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  # channel routes
  get '/channels/:channel_id/members' => 'channels#members', as: "members_of_channel"
  patch '/channels/:channel_id/join' => 'channels#join', as: "join_channel"
  patch '/channels/:channel_id/leave' => 'channels#leave', as: "leave_channel"
  patch '/channels/:channel_id/invite/:user_id' => 'channels#invite', as: "invite_channel"


  resources :users
  resources :channels, param: :channel_id
  resources :chats, :path => "channels/:channel_id/chats"

  ############### DM form doesn't work without :channel_id
  # resources :dms, :path => "dms/:user_id/:channel_id/chats"
  resources :dms, :path => "dms/:user_id/chats"
end