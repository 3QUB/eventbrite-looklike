Rails.application.routes.draw do
  root 'static_pages#home'
  resources :user
  get    '/secret',  to: 'static_pages#secret'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
