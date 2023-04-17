Rails.application.routes.draw do
  resources :sessions
  root "pages#home"
  get 'pages/home', to: 'pages#home'
  
  resources :articles do
    resources :comments, only: [:create]
    member do 
      post 'like'
    end
  end
  
  get '/signup', to: 'users#new'
  resources :users, except: [:new]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'

  resources :topics, except: [:destroy]
  
  resources :messages, only: [:create]
  
end