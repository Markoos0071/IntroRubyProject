Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pokemons#index"
  get "/pokemon", to: "pokemons#index"
  get "/pokemon/:id", to: "pokemons#show"
  get "/about", to: "about#index"
  resources :types, only: [:show]
  resources :abilities, only: [:show]
end
