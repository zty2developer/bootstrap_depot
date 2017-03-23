Rails.application.routes.draw do
  get 'admin/index'

	get 'login' => "sessions#new"
	post 'login' => "sessions#create"
	delete 'logout' => "sessions#destroy"

	scope '(:locale)' do
		resources :users
		resources :orders
		resources :line_items
		resources :carts
		resources :products

		get '/store/index'
		post '/store/index'

		root "store#index"
	end
end
