Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/airlines', to: 'airlines#index'
  get '/airlines/:id', to: 'airlines#show'

  get '/flights', to: 'flights#index'

  delete '/passengers/:id', to: 'passengers#remove_passenger_from_flight'
end
