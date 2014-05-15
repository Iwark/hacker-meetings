Rails.application.routes.draw do

  devise_for :users, :controllers => { 
  	omniauth_callbacks: 'users/omniauth_callbacks',
  	registrations: 'users/registrations'
  }
  root 'meetings#index'

  get 'meetings', to: "meetings#index", as: "user_root"
  post 'meetings/join/:id', to:"meetings#join", as: "meetings_join"
  delete 'meetings/cancel/:id', to:"meetings#cancel", as:"meetings_cancel"
  resources :meetings, only: [:show, :new, :edit, :create, :update]

end
