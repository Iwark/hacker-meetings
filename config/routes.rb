Rails.application.routes.draw do

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'welcome#index'

  get 'meetings', to: "meetings#index", as: "user_root"
  resources :meetings, only: [:new, :create]

end
