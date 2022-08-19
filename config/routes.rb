Rails.application.routes.draw do
  root 'books#index'
  get '/home', to: 'static_pages#home'
  get '/static_pages/network_test', to: 'static_pages#network_test'
  resources :users
  resources :books
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
