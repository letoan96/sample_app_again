Rails.application.routes.draw do

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete  'logout', to: 'sessions#destroy'
  
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'

  get '/signup', to: 'users#new'	
  post '/signup', to: 'users#create'	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  resources :users
  resources :microposts, only: [:create, :destroy, :update, :edit]
end
