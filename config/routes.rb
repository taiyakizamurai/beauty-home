Rails.application.routes.draw do
    devise_for :admins, controllers: {
  sessions: "admins/sessions"
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    namespace :admins do
    resources :orders, only: [:show, :update]
    resources :troubles
    resources :makers
    resources :items
    resources :customers
    get '/homes'=> 'homes#top'
    resources :order_details, only: [:update]
  end
    scope module: :public do
    get 'customers/my_page' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customers/update'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'
    get '/homes'=> 'homes#top'
    resources :makers
    get 'search' => 'items#search'
    resources :items
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items
    get '/orders/complete'
    post '/orders/confirm' => 'orders#confirm'
    resources :orders
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    resources :addresses
    resources :troubles, only: [:show]
end
   devise_for :customers, controllers: {
    sessions: "customers/sessions",
    registrations: "customers/registrations"
  }
  root to: 'public/homes#top'
end
