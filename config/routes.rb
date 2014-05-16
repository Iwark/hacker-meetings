Rails.application.routes.draw do

  get 'admin/index'

  devise_scope :user do
    get "users/edit", to: "users/registrations#edit", as: :user_root
  end

  devise_for :users, :controllers => {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  root 'meetings#index'

  post 'meetings/join/:id', to:"meetings#join", as: "meetings_join"
  delete 'meetings/cancel/:id', to:"meetings#cancel", as:"meetings_cancel"
  resources :meetings, only: [:index, :show, :new, :edit, :create, :update]

end
