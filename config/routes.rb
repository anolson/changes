Changes::Application.routes.draw do
  resources :patches, only: [:show, :create]
  get '/:permalink', to: 'patches#show'
end
