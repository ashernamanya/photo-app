Rails.application.routes.draw do
  resources :images
  #devise_for :users
  #get 'welcome/index'
mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
devise_for :users # :controllers => { :registrations => 'registrations' }
 
 
  # You can have the root of your site routed with "root"
   root 'welcome#index'

  # root 'pages#home'
  # get 'about', to: 'pages#about'
  # get 'tcc', to: 'pages#tcc'
  # get 'signup', to: 'users#new'
  # get 'login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'
  # delete 'logout', to: 'sessions#destroy'
resources :articles do
   member do
   get:suggestions
 end 
resources :comments
#resources  :suggestions
end 
resources :users do
  member do
get  :following 
get  :followers
get  :show_followers
     end

 end 
resources :categories, except: [:destroy]
resources :relationships, only: [:create, :destroy]
resources :activities
post 'password/forgot', to: 'password#forgot'
post 'password/reset', to: 'password#reset'
put 'password/update', to: 'password#update'
get '/search' => 'users#search', :as => 'search_users'
get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through
get 'notifications', to: 'notifications#index'
resources :conversations do
  resources :messages
 end
get 'my_friends', to: 'users#my_friends'
   get 'search_friends', to: 'users#search'
   post 'add_friend', to: "users#add_friend"
  resources :user_stocks, except: [:show, :edit, :update]
  resources :users, only: [:show]
  resources :friendships
  get '/signup/:invitation_token', :controller => 'users', :action => 'new' 
#resources :following, :followers
    


#mount Commontator::Engine => '/commontator'
#mount Commontator::Engine
#require 'commontator'
#mount Commontator::Engine => '/commontator'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end