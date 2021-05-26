Rails.application.routes.draw do
  devise_for :users
  root to: 'questions#index'
  resources :questions, only: [:index, :new, :create, :show, :edit, :update] do
    resources :comments, only: [:create]
    member do
      get 'close'
    end
  end

  resources :users, only: [:show, :edit, :update] do
    member do
      get 'del'
    end
  end

  post 'comment_like/:id' => 'comment_likes#create', as: 'create_comment_like'
  delete 'comment_like/:id' => 'comment_likes#destroy', as: 'destroy_comment_like'

end