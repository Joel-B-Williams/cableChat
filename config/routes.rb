Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'

  resources :chat_rooms, only: [:new, :create, :show, :index]
  resources :user, path_names: { new: sign_in, create: create}
  root 'chat_rooms#index'
end
