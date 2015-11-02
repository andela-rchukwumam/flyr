Rails.application.routes.draw do
  root 'flights#index'
  get 'flights' => 'flights#index'
  get 'bookings' => 'bookings#new'
end
