Rottenpotatoes::Application.routes.draw do
  resources :opportunities
  
  root :to => redirect('/opportunities')
end
