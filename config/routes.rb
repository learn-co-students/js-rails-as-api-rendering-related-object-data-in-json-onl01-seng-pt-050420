Rails.application.routes.draw do
  resources :sightings
  get '/birds' => 'birds#index'
  get '/sighting' => 'sighting#show'
  get '/sightings' => 'sightings#index'
end