Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # こちらは削除してOk
  root "messages#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create]
end
