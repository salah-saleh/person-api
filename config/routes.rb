Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  resources :people
  # resources :users
  # User actions
  get    '/users'          => 'users#index'
  get    '/users/current'  => 'users#current'
  post   '/users/create'   => 'users#create'
  patch  '/user/:id'       => 'users#update'
  delete '/user/:id'       => 'users#destroy'

end
