Rails.application.routes.draw do
  resources :users
  resources :attractions
  resources :cities
  resources :countries
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'users/:id/city/:city_id', to: 'users#grade', as: 'grade_user'
  get 'user/:id/city/:city_id/grade', to: 'users#city_grade', as: 'grade_city'
  post 'user/:id/city/:city_id/save', to: 'users#city_save', as: 'save_city'
  get 'user/:id/city/:city_id/nograde', to: 'users#nocity_grade', as: 'nograde_city'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "countries#index"
end
