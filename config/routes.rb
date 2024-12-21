Rails.application.routes.draw do
  post "/register", to: "auth#register"
  post "/login", to: "auth#login"
  resources :users, only: [ :index, :show, :create, :update, :destroy ]
  resources :phrases

  namespace :admin do
    resources :users, only: [ :create ]
  end
end
