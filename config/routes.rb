Rails.application.routes.draw do
  post "/register", to: "auth#register"
  post "/login", to: "auth#login"
  resources :users, only: [ :index, :show, :create, :update, :destroy ]
  resources :phrases do
    collection do
      get :search
    end
  end
  resources :quizzes, only: [ :index, :create ] do
    post :submit, on: :member
  end
  resources :tags, only: %i[index create update destroy]
  namespace :admin do
    resources :users, only: [ :create ]
  end
end
