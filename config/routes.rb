Rails.application.routes.draw do
  root to: 'chats#index'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/channels/:channel_id/members' => 'channels#members', as: "members_of_channel"
  patch '/channels/:channel_id/join' => 'channels#join', as: "join_channel"
  patch '/channels/:channel_id/leave' => 'channels#leave', as: "leave_channel"

  resources :users
  resources :channels, param: :channel_id
  resources :chats
end
