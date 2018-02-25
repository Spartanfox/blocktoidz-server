Rails.application.routes.draw do

  resources :highscores
  resources :levels
  get 'static_pages/home'

  root 'static_pages#home'

  get '/home', to: 'static_pages#home'
  
end
