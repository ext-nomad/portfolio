Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  resources :foils, only: %i[index edit create update]
end
