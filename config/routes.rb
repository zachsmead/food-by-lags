Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	get "/users/:id/edit" => "users#edit"
  	patch "/users/:id/edit" => "users#update"
    resources :users
    resources :charges


    # root to: "users#comingsoon"
    root to: "comments#index"

    get "/contacts" => "comments#index"
    post "/contacts" => "comments#create"
    get "/contacts/approved/:id" => "comments#approved"
    get "/contacts/comment_delete/:id" => "comments#comment_delete"

    post "/users/signin" => "sessions#signin"
    get "/signout" => "sessions#signout"
    get "/comingsoon" => "users#comingsoon"
    get "/products" => "products#index"
    get "/products/:id" => "products#show"
    get "/products/new" => "products#new"
    post "/products/new" => "products#create"
    get "/products/:id/edit" => "products#edit"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"

    get "/carts" => "carts#index"
    post "/carts" => "carts#create"
    get "/carts" => "carts#index"
    patch "/carts/:id" => "carts#update"

    post "/orders" => "orders#create"
    get "/orders/:id" => "orders#show"
    get "/sessions/admin_signin" => "sessions#admin_signin"




end
