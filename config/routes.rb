Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {                       
    sessions: 'users/sessions'                            
  }  
  get 'events/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :events
  resources :users

  root "events#index"
end
