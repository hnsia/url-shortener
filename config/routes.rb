Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "home#index"
  get "/:shortkey", to: "home#show"

  resources :visits
  resources :urls
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
