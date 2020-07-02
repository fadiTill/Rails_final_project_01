Rails.application.routes.draw do
  resources :welcome, only: [:home] do
  end
  # match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # # Add your routes here		   # Add your routes here


  resources :users, only: [:new, :create, :show]
  get 'users/new', to: 'users#new'
   get '/login', to: 'sessions#new'
   post "/login", to: "sessions#create"
   delete "/logout", to: "sessions#destroy" 
   root 'welcome#home'
 end		 
