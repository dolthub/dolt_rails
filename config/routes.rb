Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "articles#index"

  resources :articles do
    resources :comments
  end

  get "/commits", to: "dolt_commits#index"

  get "/branches", to: "branch#index"
  get "/branches/:status", to: "branch#index"
  get "/branches/activate/:name", to: "branch#set_active"
  get "/branches/merge/:name", to: "branch#merge"
  post "/branches", to: "branch#create"
  delete "/branches/:name", to: "branch#destroy"
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
