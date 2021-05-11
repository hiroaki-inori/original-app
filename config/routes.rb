Rails.application.routes.draw do
  root to: 'questions#index'
  get 'questions/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
