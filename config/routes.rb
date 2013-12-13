Auth::Application.routes.draw do
  
  get "/users/home", :to => "users#home"
  get "/users/news", :to => "users#news"
  get "/users/contact", :to => "users#contact"
  get "/users/about", :to => "users#about"
  root "users#index"
  
  
  
  resources :flights
  resources :seats
  resources :users
  resources :sessions
  resources :password_resets

  get "sessions/home", :to => 'sessions#home'
  
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "password_resets/new"
  get "sign_up" => "users#new", :as => "sign_up"

end

