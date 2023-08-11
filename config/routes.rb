Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root :to => 'categories#index', as: :authenticated_root
  end

  root "welcome#index"

  resources :categories, only: [:index, :show, :new, :create]
  resources :expenses, only: [:new, :create]
end
