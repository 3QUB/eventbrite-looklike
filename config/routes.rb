Rails.application.routes.draw do
  root 'static_pages#home'
  resources :user
  resources :events
  get    '/login',                  to: 'sessions#new'
  post   '/login',                  to: 'sessions#create'
  delete '/logout',                 to: 'sessions#destroy'
  post   '/events/:id/subscribe',   to: 'events#subscribe'
end
