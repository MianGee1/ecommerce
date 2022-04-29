Rails.application.routes.draw do
  root to: 'products#index'

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :products do
    resources :reviews
  end

end
