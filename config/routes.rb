Rails.application.routes.draw do
  devise_for :users
  root  'home#index'

  resources :people
  resources :events do
    resources :booths do
      get '/new',           to: 'booths#atnuser'
      post '/create',       to: 'booths#createatnuser'
    end
    resources :reserves, only: [:new, :create, :edit, :update]
  end
  #QR
  get '/qr/:qr',            to: 'reserves#qr'

  # mobile
  post 'auth_user',         to: 'mobile_auth#authenticate_user'
  get '/mobile/home',       to: 'mobile_home#index'
  get '/mobile/stats',      to: 'mobile_home#stats'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
