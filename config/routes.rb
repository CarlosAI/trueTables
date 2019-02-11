Rails.application.routes.draw do
  resources :cars
  resources :users
  root 'welcome#index'

  get '/tabla', to: 'welcome#tabla'
  get '/expresion', to: 'welcome#expresion'

  post '/vxprs', to: 'welcome#expresion'
  post '/tabla', to: 'welcome#tabla'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
