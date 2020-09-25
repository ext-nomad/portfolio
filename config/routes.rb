Rails.application.routes.draw do
  devise_for :users
  resources :foils
  root 'home#index'
  get 'home/index'
end
