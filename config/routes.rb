# config/routes.rb

Rails.application.routes.draw do
  # Set the root route to the index action of restaurants controller
  root to: 'restaurants#index'

  # Routes for restaurants
  get '/restaurants', to: 'restaurants#index', as: 'restaurants'
  get '/restaurants/new', to: 'restaurants#new', as: 'new_restaurant'
  post '/restaurants', to: 'restaurants#create'
  get '/restaurants/:id', to: 'restaurants#show', as: 'restaurant'

  # Routes for adding a new review to a restaurant
  get '/restaurants/:restaurant_id/reviews/new', to: 'reviews#new', as: 'new_restaurant_review'
  post '/restaurants/:restaurant_id/reviews', to: 'reviews#create', as: 'restaurant_reviews'
end
