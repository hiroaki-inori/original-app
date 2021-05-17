Rails.application.routes.draw do
  devise_for :users
  root to: 'questions#index'
  resources :questions, only: [:index, :new, :create, :show, :edit, :update] do
    resources :comments, only: [:create] do
      resources :likes, only: [:create]
    end
  end

  resources :users, only: [:show, :edit, :update]
  # post "likes/:comment_id/create", to: "likes#create", constraints: {comment_id: /\d+/}, as: :likes_create
end