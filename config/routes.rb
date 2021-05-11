Rails.application.routes.draw do
  devise_for :users
  root to: 'questions#index'
  get 'questions/index'
end
