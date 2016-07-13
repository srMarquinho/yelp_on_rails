Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "restaurants#index"

  devise_for :users

  resources :restaurants do
    resources :reviews
  end
end
