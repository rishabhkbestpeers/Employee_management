Rails.application.routes.draw do
  root 'employees#index'
  # get 'employees/new', to: 'employees#new'
  # post 'employees', to: 'employees#create'
  # get 'employees/:id/destroy', to: 'employees#destroy'
  # get 'employees/:id', to: 'employees#show'
  # get 'employees/:id/edit', to: 'employees#edit'
  resources :employees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Defines the root path route ("/")
  # root "posts#index"
end
