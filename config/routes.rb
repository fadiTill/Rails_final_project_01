Rails.application.routes.draw do
 

#localhost3000 to get github

  
 resources :users, only: [:new, :create, :show, :edit]
 get 'users/new', to: 'users#new'
   get '/signin', to: 'sessions#new'
    get '/auth/:provider/callback' => 'sessions#create'
  post "/signin", to: "sessions#create"
 get "/signout", to: "sessions#destroy" 
 
 root 'welcome#home'
 

 resources :houses do
    resources :guests, only: [ :new, :create, :show,  :index, :destroy ]

end

resources :guests
 
end