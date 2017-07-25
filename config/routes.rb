Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get "/users/signout" => "sessions#signout"
  	get "/users/:id/edit" => "users#edit"
  	patch "/users/:id/edit" => "users#update"
    resources :users
    root to: "users#index"
    post "/users/signin" => "sessions#signin"

end
