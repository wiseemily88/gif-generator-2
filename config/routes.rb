Rails.application.routes.draw do
  resources :users, only: [:show, :create, :new] do
    resources :gifs, only: [:index]
    resources :favorite_gifs, only: [:index, :new, :create, :show]
  end

  root "welcome#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create', as: "login_path"
  delete '/logout', to: 'sessions#destroy'
  delete '/unfavorite', to: 'favorites#destroy'


  namespace :admin do
    resources :categories, only: [:new, :create, :index, :destroy]
    resources :gifs, only: [:new, :create, :destroy, :index]
  end
end
