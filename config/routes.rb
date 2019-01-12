Rails.application.routes.draw do
  namespace :admin do
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
