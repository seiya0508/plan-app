Rails.application.routes.draw do
  devise_for :users do
  end
  root to: "garbages#index"
  resources :garbages, only: [:new, :create, :edit, :update, :destroy, :show]
end
