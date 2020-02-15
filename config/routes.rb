Rails.application.routes.draw do
  resources :submissions
  get 'home/index'
  devise_for :users
  root to: "home#index"
end
