Rails.application.routes.draw do

  get 'comments/post'

  get 'joins/join/:id' => "joins#join"

  get 'joins/cancel'

  get 'events/' => 'events#index'

  get 'events/show/:id' => 'events#show'

  post 'events/create' => 'events#create'

  get 'events/delete'

  get 'events/show'

  get 'events/edit'

  post 'sessions/create' => 'sessions#create'

  get 'sessions/index'

  get '/sessions/destroy' => 'sessions#destroy'

  post 'users/create' => 'users#create'

  get 'users/:id/edit' => 'users#edit'

  patch '/users/:id' => 'users#update'

  root to: 'sessions#index'
end