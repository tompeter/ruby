Rails.application.routes.draw do
  root 'products#index'
  devise_for :users
  resources :home, only: :index
  resources :products do
    collection do
      get :search
      get :contact
      get :blog
    end
  end

  get '/admin', to: 'admin/products#index'
  namespace :admin do
    resources :products 
    resources :categories
    resources :brands
  end
end