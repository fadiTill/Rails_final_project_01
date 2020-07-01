Rails.application.routes.draw do
  resources :welcome, only: [:home] do
  end
  # match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # # Add your routes here		   # Add your routes here



   get '/login', to: 'sessions#new'
   post "/login", to: "sessions#create"
   delete "/logout", to: "sessions#destroy" 
   root 'welcome#home'
 end		 
