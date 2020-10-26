Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'about', to: 'pages#about'
  get 'courses/new', to: 'courses#new'
  
  resources :students, except: [:destroy]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  
  root 'courses#index'
  
end
