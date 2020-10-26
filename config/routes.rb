Rails.application.routes.draw do
  root to: 'sessions#new'
  get 'sessions/new'
  namespace :admin do
    resources :users
  end
  resources :tasks
  resources :sessions, only:[:new, :create, :destroy]
end
