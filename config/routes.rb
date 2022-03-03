Rails.application.routes.draw do
  # resources :memberships
  # resources :clients
  # resources :gyms
  post '/memberships', to: 'memberships#create'
  
  get '/gyms', to: 'gyms#index'
  get '/gyms/:id', to: 'gyms#show'
  patch '/gyms/:id', to: 'gyms#update'
  delete '/gyms/:id', to: 'gyms#destroy'

  get '/clients', to: 'clients#index'
  get '/clients/:id', to: 'clients#show'
  patch '/clients/:id', to: 'clients#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
