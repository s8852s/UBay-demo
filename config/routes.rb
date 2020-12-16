Rails.application.routes.draw do
  root 'stores#index'
  resource :stores, only: [:show, :edit, :update] do
    get '/productlist', to: 'products#index'
    resources :products, shallow: true, only: [:show, :new, :create, :edit, :update, :destroy] do
    end
  end
end
