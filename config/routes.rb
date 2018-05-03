Rails.application.routes.draw do
  root 'static_pages#home'
  resources :user
  resources :events do
    post '/subscribe',   to: 'events#subscribe'
    post '/unsubscribe', to: 'events#unsubscribe'
    get  '/invite',      to: 'events#invite'
    post '/invite/:user_id',      to: 'events#submit_invit',format: false, :constraints => { :user_id => /[^\/]+/ }
  end
  get    '/login',       to: 'sessions#new'
  post   '/login',       to: 'sessions#create'
  delete '/logout',      to: 'sessions#destroy'

end
