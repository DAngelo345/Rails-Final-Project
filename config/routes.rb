Rails.application.routes.draw do
  
  get "/login", to: "sessions#login", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#logout", as: "logout"

  resources :favorites
  resources :shoes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
