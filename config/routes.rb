Rails.application.routes.draw do
  resources :users, except: [:new]
  resources :yieldrecs
  resources :cultivars
  resources :species
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'calc#index'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
