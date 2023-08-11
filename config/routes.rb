Rails.application.routes.draw do
  devise_for :users

  root "welcome#index"

  resources :categories, only: [:index, :show, :new, :create]
  resources :expenses, only: [:new, :create]
end
