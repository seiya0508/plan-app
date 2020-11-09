Rails.application.routes.draw do
  devise_for :users
  root to: "garbages#index"
  resources :garbages, only: [:new, :create, :edit]
end
