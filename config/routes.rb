Rails.application.routes.draw do
  root 'flights#index'
  get 'flights' => 'flights#index'
  get 'bookings' => 'bookings#new'
  get    'about'   => 'flights#about'
  get    'contact' => 'flights#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  get 'logout'  => 'sessions#destroy'
  get 'search' => 'flights#search', as: "flights_search"
  resources :users
end
