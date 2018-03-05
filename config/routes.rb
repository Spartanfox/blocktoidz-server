Rails.application.routes.draw do

  resources :highscores

  resources :levels do
    get 'upload'
    resources :highscores
  end

  get 'static_pages/home'
  get 'static_pages/download'

  root 'static_pages#home'

  get '/home', to: 'static_pages#home'
  get '/download', to: 'static_pages#download'

end
