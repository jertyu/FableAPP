Rails.application.routes.draw do
  resources :tales
  resources :submissions
  devise_for :users
	root to: "tales#index"
	get "/home" => "tales#index"
  get "/u/" => "users#index"


	devise_scope :user do
  		get "/login" => "devise/sessions#new"
  		get "/register" => "devise/registrations#new"
  		get "/settings" => "devise/registrations#edit"
   		get '/signout', to: 'devise/sessions#destroy', as: :signout
      get '/u/:id', :to => 'users#show',  :as => :user
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
