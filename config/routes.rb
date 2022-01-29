Rails.application.routes.draw do
  root to: 'page#home'

  resources :users
  resources :channels
  resources :chats
end
