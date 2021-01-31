Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  resources :foils, only: %i[index edit create update destroy]
  post 'foils/refresh', to: 'foils#refresh'
end
