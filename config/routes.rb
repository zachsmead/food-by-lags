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
    get "/contacts/text_approved/:id" => "comments#text_approved"
    get "/contacts/text_delete/:id" => "comments#text_delete"

    post "/users/signin" => "sessions#signin"
    get "/signout" => "sessions#signout"
    get "/comingsoon" => "users#comingsoon"
    get "/products" => "products#index"
    get "/products/:id" => "products#show"
    get "/products/new" => "products#new"
    post "/products/new" => "products#create"
    get "/products/:id/edit" => "products#edit"
    post "/products/update" => "products#update"
    delete "/products/:id" => "products#destroy"

    get "/carts" => "carts#index"
    post "/carts" => "carts#create"
    get "/carts" => "carts#index"
    patch "/carts/:id" => "carts#update"

    post "/orders" => "orders#create"
    get "/orders/:id" => "orders#show"
    get "/sessions/admin_signin" => "sessions#admin_signin"

    get "/api_for_lags/index" => "api_for_lags#index"
    get "/api_for_lags/products_index" => "api_for_lags#products_index"
    post "/api_for_lags/create" => "api_for_lags#create"
    post "/api_for_lags/delete_cart_item" => "api_for_lags#delete_cart_item"
    post "/api_for_lags/create_order" => "api_for_lags#create_order"
    post "/api_for_lags/create_comment" => "api_for_lags#create_comment"

end
