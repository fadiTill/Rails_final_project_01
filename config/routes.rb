Rails.application.routes.draw do
  resources :welcome, only: [:home] do
  end
  # match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # # Add your routes here		   # Add your routes here



  resources :houses 
 resources :users, only: [:new, :create, :show]
 get 'users/new', to: 'users#new'
 get '/signin', to: 'sessions#new'
 post "/signin", to: "sessions#create"
 delete "/signout", to: "sessions#destroy" 
 root 'welcome#home'

end