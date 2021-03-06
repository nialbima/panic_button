Rails.application.routes.draw do
  resources :comments, :topics, :resources, :users

  root 'topics#index'

  # login/logout methods
  get '/login', to: 'users#login'
  post '/login', to: 'users#login_post'
  get '/logout', to: 'users#logout'

  post '/comments', to: 'comments#show'

  get '/it-is-gonna-be-fine', to: 'comments#selfcare'

end
