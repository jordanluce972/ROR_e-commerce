Rails.application.routes.draw do
	get '/login' => 'admin/sessions#new'
	get '/logout' => 'admin/sessions#destroy'

namespace :admin do
	root to: 'products#index'
	resources :products
	resources :sessions, only: [:new, :create, :destroy]
	resources :sizes, except: [:show, :new]
	resources :customers, only:[:index, :show, :destroy]
	resources :orders, only:[:index]
end

end
