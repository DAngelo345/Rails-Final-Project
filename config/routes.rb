Rails.application.routes.draw do
  get "/search", to: "shoes#search"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#login", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#logout", as: "logout"
  delete "/delete", to: "favorites#destroy", as: "favorite_delete"
  get "/auth/google_oauth2/callback", to: "sessions#omniauth"
  get "/rating10", to: "favorites#shoes_with_rating_of_10", as: "rating10"
  get "/brands", to: "shoes#brand", as: "brand"
  # :provider
  
  resources :users do 
    resources :favorites, only: [:show, :index, :create]
  end
  resources :shoes do 
    resources :favorites, only: [:create]
  end
  resources :favorites

  # google_oauth2
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
