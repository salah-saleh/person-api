Rails.application.routes.draw do
  scope :api, default: {format: 'json'}, constraints: {format: 'json'} do

    scope '(:version)', module: 'v1/movies' do
      resources :movies, except: [:create]
      resources :movies, only: [:show] do
        resources :ratings, :controller => "ratings", only: [:index, :create]
        resources :categories, :controller => "categories", only: [:index, :create]
      end
    end

    scope '(:version)', module: 'v1/categories' do
      resources :categories, except: [:destroy]
    end

    scope '(:version)', module: 'v1/ratings' do
      resources :ratings, only: [:update]
    end

    scope '(:version)', module: 'v1/users' do
      resources :users, only: [:create]
      resources :users, only: [:show] do
        resources :movies, :controller => "movies", only: [:index, :create]
        resources :ratings, :controller => "ratings", only: [:index]
      end
      post 'authenticate', to: 'users#authenticate'
    end

  end
end
