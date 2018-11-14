Rails.application.routes.draw do
  use_doorkeeper

  # devise_for :users, controllers: { sessions: "users/sessions" } do
  #   delete 'signout' => 'users/sessions#destroy', :as => :destroy_user_session
  #   get 'signin' => 'devise/sessions#new', :as => :new_user_session
  #   post 'signin' => 'devise/sessions#create', :as => :user_session
  # end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {format: 'json'} do
  	# /api/...
  	namespace :v1 do
  		# /api/v1/...
  		resources :products
  	end
  end

  resources :products
  root 'products#index'
end
