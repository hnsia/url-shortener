Rails.application.routes.draw do
  resources :visits
  resources :urls
  
  # Defines the root path route ("/")
  root "home#index"
  get "/:shortkey", to: "home#show"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
