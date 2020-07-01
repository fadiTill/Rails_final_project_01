Rails.application.routes.draw do
  resources :welcome, only: [:home] do
  end
  # match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # # Add your routes here		   # Add your routes here
   root 'welcome#home'
 end		 
