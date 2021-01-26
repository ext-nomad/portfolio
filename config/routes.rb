Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  resources :foils, only: %i[index edit create update]
  post 'foils/capture', to: 'foils#capture'
end
