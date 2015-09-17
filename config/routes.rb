Rails.application.routes.draw do
  resources :comments, :topics, :resources, :users

  root 'topics#index'

  # login/logout methods
  get '/login', to: 'users#login'
  post '/login', to: 'users#login_post'
  get '/logout', to: 'users#logout'

end
