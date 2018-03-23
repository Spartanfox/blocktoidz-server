Rails.application.routes.draw do

  resources :highscores

  resources :levels do
    get 'upload'
    resources :highscores
  end

  get 'static_pages/home'
  get 'static_pages/download'
  get 'static_pages/privacy_policy'
  get '/home', to: 'static_pages#home'
  get '/download', to: 'static_pages#download'
  get '/privacy_policy', to: 'static_pages#privacy_policy'


  root 'static_pages#home'



end
