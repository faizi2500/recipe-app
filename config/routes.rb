Rails.application.routes.draw do
  devise_for :users
  root 'foods#index'
  get 'users/index'
  resources :users, only: %i[index]
  resources :foods, only: %i[index new create destroy]
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:new, :create, :destroy]
  end
  resources :inventories do
    resources :inventory_foods
  end
  put 'recipes/:id/update', to: 'recipes#update', as: 'update'
  get 'public_recipes', to: 'recipes#public', as: 'public'
  get 'shopping_list/recipe_id=:recipe_id&inventory_id=:inventory_id', to: 'recipes#generate', as: "shopping_list"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
