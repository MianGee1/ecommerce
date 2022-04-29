Rails.application.routes.draw do
  resources :products
  devise_for :users
  root to: 'products#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
