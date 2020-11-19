AdminDashboard::Engine.routes.draw do
  resources :investigators
  resources :organizations
  resources :users
  root 'home#index'
end
