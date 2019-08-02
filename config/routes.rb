Rails.application.routes.draw do
  namespace :v1 do
    resources :users, only: [:create] do
      resources :food_intakes, only: [:create]
      resources :activities, only: [:create]
    end
    resources :food_categories, only: [:index]
  end
end
