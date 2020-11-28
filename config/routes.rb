Rails.application.routes.draw do
  get 'comments/new'
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :buyers
    resources :orders
    resources :comments ,only: [:create, :new]
  end
end
