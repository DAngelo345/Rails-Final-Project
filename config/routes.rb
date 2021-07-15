Rails.application.routes.draw do
  
  get "/login", to: "sessions#login", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#logout", as: "logout"

  resources :users do
    # nested resource for posts
    resources :shoes, only: [:show, :index, :new]
  end

  resources :favorites
  resources :shoes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
