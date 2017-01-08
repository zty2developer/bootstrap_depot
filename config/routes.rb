Rails.application.routes.draw do
  get 'store/index'

  resources :products
	
	root "store#index"
end
