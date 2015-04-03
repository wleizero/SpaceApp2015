Collabotree40::Application.routes.draw do
  
  resources :forests do
    resources :projects
  end
  

  resources :activities

  resources :actions

  resources :projects

  
  resources :leafs do
    resources :comments
    
    resources :leafs
    member do
      get :accept
    end
  end

  get 'votes/:id/vote_up' => 'vote#vote_up', as: 'vote_up'
  get 'votes/:id/vote_down' => 'vote#vote_down', as: 'vote_down'

  get 'leafs/:id/follow' => 'follow#follow', as: 'follow'
  get 'leafs/:id/unfollow' => 'follow#unfollow', as: 'unfollow'


  resources :explore, :only => :index
  resources :tree, :only => :index
  resources :map, :only => :index

  devise_for :users, :path => "auth", 
      :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register'},
      :controllers => { omniauth_callbacks: "users/omniauth_callbacks", sessions: 'sessions' }

  resources :users

  
  root :to => 'visitors#new'
  
end
