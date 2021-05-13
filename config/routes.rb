Rails.application.routes.draw do
  devise_for :users
  root to: 'questions#index'
  resources :questions, only: [:index, :new, :create, :show, :edit, :update] do
    resources :comments, only: [:create]
  end

  resources :users, only: [:show, :edit, :update]
end