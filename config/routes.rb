DayTweeter::Application.routes.draw do
  get "pages/home"

  get 'auth/failure',            to: 'sessions#denied'
  get 'auth/twitter',                                    as: :twitter_auth
  get 'auth/:provider/callback', to: 'sessions#create',  as: :twitter_auth_callback
  get 'signout',                 to: 'sessions#destroy', as: :signout
  
  get '/not/implemented/yet', to: 'pages#placeholder', as: :placeholder
  
  root to: 'pages#home'
end
