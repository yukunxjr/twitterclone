Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'tweets#index'

  resources :tweets do
    resources :favorites, only: [:create, :destroy]
  end
  
  resources :users

end
