Rails.application.routes.draw do
  resources :orders
  resources :line_items
  resources :carts
  resources :products

  get 'store/index'
	
	root "store#index"
end
