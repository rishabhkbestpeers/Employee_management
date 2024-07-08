Rails.application.routes.draw do
  
  get 'session/new', to: 'session#new'
  post 'session/new', to: 'session#create'
  get 'session/create', to: 'session#create'
  get 'session/log_out', to: 'session#destroy'

  get '/sign_up', to: 'user#new'
  post '/sign_up', to: 'user#create'

  # get 'employees/new', to: 'employees#new'
  # post 'employees', to: 'employees#create'
  # get 'employees/:id/destroy', to: 'employees#destroy'
  # get 'employees/:id', to: 'employees#show'
  # get 'employees/:id/edit', to: 'employees#edit'
  resources :employees
  get "healthz" => "rails/health#show", as: :rails_health_check
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Defines the root path route ("/")
  # root "posts#index"
end
