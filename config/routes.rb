Rails.application.routes.draw do
  namespace :v1 do
    resources :users, only: [:create] do
      resources :food_intakes, only: [:index, :create] do
        collection do
          get :recipe
        end
      end
      resources :activities, only: [:create]
    end
    resources :food_categories, only: [:index]
  end
end
