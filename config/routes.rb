Rails.application.routes.draw do
  devise_for :users do
    get "/users/sign_out"
  end
  root to: "garbages#index"
  resources :garbages, only: [:new, :create, :edit, :update, :destroy]
end
