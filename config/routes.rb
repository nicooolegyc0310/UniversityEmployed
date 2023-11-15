Rottenpotatoes::Application.routes.draw do
  resources :opportunities
  
  #root :to => redirect('/opportunities')

  # root routes
  root 'sessions#login'

  # user routes
  resources :users, only: [:new, :create, :edit, :update, :index, :destroy]

  # session routes
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  # sign up route
  get '/signup', to: 'users#new', as: 'signup'

  # applications routes
  resources :applications, only: [:index]
end
