Rails.application.routes.draw do
  resources :pins do
    resources :ratings, only: [:create, :edit, :update, :destroy]
  end

  devise_for :users
  root 'pins#index'
end
