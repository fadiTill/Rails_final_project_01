Rails.application.routes.draw do
  # resources :welcome, only: [:home] do
  # end
  # match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # # Add your routes here		   # Add your routes here



  
 resources :users, only: [:new, :create, :show, :edit]
 get 'users/new', to: 'users#new'
 get '/signin', to: 'sessions#new'
#  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  post "/signin", to: "sessions#create"
 get "/signout", to: "sessions#destroy" 
 
 root 'welcome#home'


 resources :houses do
    resources :guests, only: [ :new, :create, :show, :destroy, :index, :edit]

end

resources :guests
 
end