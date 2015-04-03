Collabotree40::Application.routes.draw do
  
  devise_for :users, :path => "auth", 
      :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register'},
      :controllers => { omniauth_callbacks: "users/omniauth_callbacks", sessions: 'sessions' }

  resources :users

  
  root :to => 'visitors#new'
  
end
