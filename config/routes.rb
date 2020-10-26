Rails.application.routes.draw do
  get 'sessions/new'
  namespace :admin do
    resources :users
  end

  root to: 'tasks#index'
  resources :tasks

  resources :sessions, only:[:new, :create, :destroy]
end
