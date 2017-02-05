Rails.application.routes.draw do
  get 'people/index'

  devise_for :users
  root  'home#index'
  get   '/people',            to: 'people#index'
  get   '/people/:id',        to: 'people#show'
  post  '/people',            to: 'people#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
