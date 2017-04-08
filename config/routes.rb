Rails.application.routes.draw do
	scope '(:locale)' do
		resources :categories
		resources :users
		resources :orders
		resources :line_items
		resources :carts
		resources :products

		get '/store/index'
		post '/store/index'
		post '/store/category' => 'store#category'

		get '/admin' => 'admin#index'
		get '/about' => 'store#about'
		get '/contact' => 'store#contact'

		get 'login' => 'sessions#new'
		post 'login' => 'sessions#create'
		delete 'logout' => 'sessions#destroy'

		root 'store#index'
	end
end
