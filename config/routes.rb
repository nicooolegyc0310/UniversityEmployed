Rottenpotatoes::Application.routes.draw do
  resources :opportunities
  
  #root :to => redirect('/opportunities')

  root 'sessions#login'

  resources :users, only: [:new, :create, :edit, :update, :index, :destroy]

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new', as: 'signup'
end
