Rails.application.routes.draw do
  get 'events/new'
  get 'events/show'
  get 'events/edit'
  get 'events/index'
  root 'static_pages#home'
  resources :user
  get    '/secret',  to: 'static_pages#secret'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
