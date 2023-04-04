Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {                       
    sessions: 'users/sessions'                            
  }  
  get 'events/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users do
    resources :events do
      resources :attended_events
    end
  end

  root "events#index"
end
