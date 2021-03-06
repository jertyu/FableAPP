Rails.application.routes.draw do
  resources :tales do
    resources :comments
  end
  devise_for :users

	root to: "tales#index"
	get "/home" => "tales#index"
  get "/u/" => "users#index"
  get "/users" => "users#index"


	devise_scope :user do
  		get "/login" => "devise/sessions#new"
  		get "/register" => "devise/registrations#new"
  		get "/settings" => "devise/registrations#edit"
   		get '/logout', to: 'devise/sessions#destroy', as: :signout
      get '/u/:id', :to => 'users#show', :as => :user
      get '/u/:id/edit', :to => 'users#edit_user', :as => :edit_user
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   get "*any", via: :all, to: "errors#not_found"
   resources :users do
      resources :tales
   end

end
