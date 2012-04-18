DayTweeter::Application.routes.draw do

  root to: 'pages#home'
  
  get 'home',                     to: 'users#show',       as: :home
  get 'my/account',               to: 'users#edit',       as: :account_settings
  get 'auth/failure',             to: 'sessions#denied'
  get 'auth/twitter',                                     as: :twitter_auth
  get 'auth/:provider/callback',  to: 'sessions#create',  as: :twitter_auth_callback
  get 'signout',                  to: 'sessions#destroy', as: :signout
  
  get 'not/implemented/yet',      to: 'pages#placeholder', as: :placeholder
    
  resource :user, only: [:show, :edit, :update, :destroy]
  
  resource :system, only: [:update] do
    member do
      get 'activate'
      get 'pause'
    end
  end
  
  resources :tweets, only: [:create, :update, :destroy] do
    member do
      get 'publish'
      get 'unpublish'
      get 'enable'
      get 'disable'
    end
    collection do
      get 'clear_published'
    end
  end
  
  namespace :admin do
    mount Resque::Server, at: 'resque', as: :resque
  end
  
end
