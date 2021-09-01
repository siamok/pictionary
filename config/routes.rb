Rails.application.routes.draw do
  resources :pins do
    resources :ratings
  end

  devise_for :users
  root 'pins#index'
end
