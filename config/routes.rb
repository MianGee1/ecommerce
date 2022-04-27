Rails.application.routes.draw do
  get 'products/index'
  get 'products/show'
  get 'products/new'
  get 'products/edit'
  get 'products/create'
  get 'products/update'
  get 'products/destroy'
  get 'products/index'
  get 'products/show'
  get 'products/new'
  get 'products/edit'
  get 'products/create'
  get 'products/update'
  get 'products/destroycontroller'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'products#index'
end
