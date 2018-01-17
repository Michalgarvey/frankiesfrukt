Rails.application.routes.draw do
  devise_for :users
  resources :users
  get 'simple_pages/landing_page'

  resources :products
  get 'simple_pages/other'

  get 'simple_pages/about'

  get 'simple_pages/contact'

  get 'simple_pages/index'
  root 'simple_pages#landing_page'

  get '/products/:id', to: 'products#show'

  resources :orders, only: [:index, :show, :create, :destroy]

  post 'simple_pages/thank_you'


  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    delete 'logout', to: 'devise/sessions#destroy'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
