Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root 'application#hello'
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles #, only: [:show,:index,:new,:create,:edit,:update,:destroy]
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users, except: [:new]
  resources :categories, except: [:destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
