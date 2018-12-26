Rails.application.routes.draw do
  resources :users, except: [:new]
  resources :yieldrecs
  resources :cultivars
  resources :species
  resources :plots
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'plots#index'
  get "plots/download_pdf"
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
