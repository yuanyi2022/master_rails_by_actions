Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'index#index'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check
  devise_for :users, controllers: { sessions: 'users/sessions' }
  namespace :admin do
    root 'sessions#new'
    resources :sessions
    resources :tickets
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
