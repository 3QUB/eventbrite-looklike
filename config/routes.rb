Rails.application.routes.draw do
  root 'static_pages#home'
  resources :user
  resources :events do
    post '/subscribe', to: 'events#subscribe'
  end
  get    '/login',                  to: 'sessions#new'
  post   '/login',                  to: 'sessions#create'
  delete '/logout',                 to: 'sessions#destroy'
  #post   '/events/:id/subscribe',   to: 'events#subscribe'
end
