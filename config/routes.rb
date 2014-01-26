Changes::Application.routes.draw do
  resources :pull_requests, only: [:show, :create]
  get '/:permalink', to: 'pull_requests#show'
end
