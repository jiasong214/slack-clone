Rails.application.routes.draw do
  root to: 'chats#index'

  resources :users
  resources :channels
  resources :chats
end
