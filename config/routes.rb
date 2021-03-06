Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }, controllers: { registrations: "user_registrations" }

  resources :orders, only: [:index, :show, :create, :destroy]
  resources :products
  resources :users

  resources :products do
    resources :comments
  end

  root 'simple_pages#landing_page'
  get 'simple_pages/landing_page'
  get 'simple_pages/index'
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/other'
  get 'payments/create'

  post 'simple_pages/thank_you'
  post 'payments/create'

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
