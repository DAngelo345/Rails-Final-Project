Rails.application.routes.draw do
  get "/search", to: "shoes#search"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#login", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#logout", as: "logout"


  resources :users do 
    resources :favorites, only: [:show, :index, :create]
  end
  resources :shoes do 
    resources :favorites, only: [:create]
  end
  resources :favorites
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
