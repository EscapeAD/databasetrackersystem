Rails.application.routes.draw do
  devise_for :users
  root  'home#index'

  resources :people
  resources :events do
    resources :booths do
      get '/new', to: 'booths#atnuser'
      post '/create', to: 'booths#createatnuser'
    end
    resources :reserves, only: [:new, :create, :edit, :update]
  end
  get '/qr/:qr', to: 'reserves#qr'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
