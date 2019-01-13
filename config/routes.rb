Rails.application.routes.draw do
  get '/reservations' => 'reservations#index'
  post '/reservations' => 'reservations#create'
  namespace :admin do
    resources :payments
    resources :packages
    post '/reservations/update' => 'reservations#update'
    resources :reservations, except: [:edit, :destroy, :update]
    resources :clients

    get '/reset-password' => 'users#reset_password'
    post '/reset-password' => 'users#reset_password'
    get '/forgot-password' => 'users#forgot_password'
    post '/forgot-password' => 'users#forgot_password'
    get '/logout' => 'users#logout'
    get '/login' => 'users#login'
    post '/login' => 'users#login'
    resources :users
  end
  get '/payment' => 'home#payment'
  get '/contact-us' => 'home#contact'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
