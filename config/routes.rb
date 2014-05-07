Rails.application.routes.draw do

  root 'welcome#index'

  resources :meetings, only: [:index, :new, :create]

end
