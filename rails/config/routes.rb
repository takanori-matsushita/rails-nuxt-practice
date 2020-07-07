Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home'
  get '/home', to: 'static_pages#home'
  resources :users, only: [:index, :create, :show, :update, :destroy]
  post '/login', to: 'authentication#create'
  resources :microposts, only: [:create, :destroy]
end
