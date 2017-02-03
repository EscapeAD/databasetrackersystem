Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get  '/people',          to: 'home#all'
  get '/people/:id',       to: 'home#show'
  post '/people',          to: 'home#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
