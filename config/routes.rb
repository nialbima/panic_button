Rails.application.routes.draw do
  resources :comments, :topics, :resources, :users

  root 'topics#index'

  # login/logout methods
  get '/login', to: 'users#login'
  post '/login', to: 'users#login_post'
  get '/logout', to: 'users#logout'

  # return to resource after editing/posting comment
  post '/comments/new', to: 'resources#show'

  post '/comments/edit', to: 'resources#show'

end
