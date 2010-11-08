PathsOfGlorySampleApp::Application.routes.draw do
  devise_for :users
  
  resources :posts, :only => :create
  resources :comments, :only => :create

  root :to => "home#index"
end
