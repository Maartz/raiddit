Rails.application.routes.draw do
  resources :communities do
    resource :subscriptions
  end

  resources :submissions do
    # Out of the REST Scope
    member do
      put 'upvote', to: 'submissions#upvote'
      put 'downvote', to: 'submissions#downvote'
    end
    resources :comments do
      member do
        put 'upvote', to: 'comments#upvote'
        put 'downvote', to: 'comments#downvote'
      end
    end
  end

  devise_for :users
  resources :users, only: [:show], as: 'profile', path: 'profile'
  root to: 'submissions#index'
end
