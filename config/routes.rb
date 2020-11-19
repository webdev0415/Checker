Rails.application.routes.draw do
  root 'home#index'

  mount AdminDashboard::Engine, at: "admin"
  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?

  resource :session, controller: "sessions", only: %i[new create destroy]

  get "/log_in" => "sessions#new", as: "log_in"
  delete "/log_out" => "sessions#destroy", as: "log_out"

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:edit, :update]
  end


  resources :identities, only: [:index]
  resources :groups
  resources :signup_identities, only: [:create, :show]

  resources :investigator, only: [:index]
  get '/investigator/:org_id' =>  "identities#identities", as: "organization_identities"
end
