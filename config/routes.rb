Rails.application.routes.draw do
  root 'home#index'
  get 'captive', to: 'home#captive'

  devise_for :users
  resources :foils
end
