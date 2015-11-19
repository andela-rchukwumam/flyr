Rails.application.routes.draw do
  root 'flights#index'
  get 'flights' => 'flights#index'
  get 'pay_ticket' => 'bookings#pay_for_ticket'
  get 'bookings' => 'bookings#new'
  get 'new_bookings' => 'bookings#create'
  get 'show_bookings' => 'bookings#show'
  get    'about'   => 'flights#about'
  get    'contact' => 'flights#contact'
  get    'signup'  => 'users#new'
  # get '/users/:id', to: 'users#show', as: 'current_user'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  get 'logout'  => 'sessions#destroy'
  get 'search' => 'flights#search', as: "flights_search"
  get 'paypal' => 'bookings#payment'
  resources :users
  resources :bookings
end
