Changes::Application.routes.draw do
  resources :patches, only: [:show, :create]
  resources :pages, only: [:index]

  get '/:permalink', to: 'patches#show'
  root to: 'pages#index'
end
