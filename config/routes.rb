Rails.application.routes.draw do
  root 'stores#index'
  resources :stores do
    get '/productlist', action: 'products#index'
    resources :products, shallow: true, only: [:show, :new, :create, :edit, :update, :destroy] do
    end
  end
end
