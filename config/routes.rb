Rails.application.routes.draw do
  resources :relationships
  resources :yips
  get 'sessions/new'

  post 'sessions/create'

  get 'sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  root to:  'users#new'

end
