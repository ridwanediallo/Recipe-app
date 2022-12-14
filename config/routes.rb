Rails.application.routes.draw do
  devise_for :users
  # resources :recipe_foods
  resources :foods
  # resources :recipes
  resources :recipes do
    resources :recipe_foods
  end

  resources :users

  get 'public_recipes', to: 'recipes#public_recipes'

  # resources :users, only: [:index, :show] do
  #   resources :recipes, only: [:index, :show, :new, :create] do
  #     resources :recipe_foods, only: [:index, :show, :new, :create]
  #   end
  # end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
