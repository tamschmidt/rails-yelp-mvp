Rails.application.routes.draw do
  resources :restaurants, only: [:create, :index, :show, :new] do
    resources :reviews, only: [:new, :create, :index]
  end
  root to: 'restaurants#index'
end
