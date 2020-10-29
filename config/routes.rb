Rails.application.routes.draw do
  root to: 'sessions#new'

  scope module: :admin do
  resources :users, only: [:new, :create, :show]
  end
  namespace :admin do
    resources :users, only: [:index, :new, :create, :show, :edit, :update, :destroy ]
  end

  resources :tasks

  resources :sessions, only:[:new, :create, :destroy]

  resources :stickers, only:[:index, :new, :create, :destroy]
end
