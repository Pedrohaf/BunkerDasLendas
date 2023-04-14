Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "pages#home"
  get 'pages/home', to: 'pages#home'
  get '/articles', to: 'articles#index'
  get '/articles/new', to: 'articles#new', as: 'new_article'
  get 'articles/:id', to: 'articles#show', as: 'article'
  resources :articles

  get '/signup', to: 'users#new'
  
  resources :users, except: [:new]
  
end
