Rottenpotatoes::Application.routes.draw do
  resources :opportunities
  
  #root :to => redirect('/opportunities')

  root 'sessions#home'

  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new', as: 'signup'
end
