ProjectAsscociation::Application.routes.draw do
  resources :locations do
  get 'show_locations', to: 'locations#show_locations'
  end
  get "map/index"
  resources :products 
  get 'all_users', to: 'products#all_users'
  get 'product_detail', to: 'products#product_detail'
  #get  'destroy_user' , to: 'products#destroy_user'
  devise_for :users 
  get 'destroy_user', to: 'products#destroy_user'
#match 'products/:id/destroy_user' => 'products#destroy_user'
  # devise_for :users, :controllers => {:registrations => "registrations"} do
  # get "welcome" => "registrations#destroy", :method => :delete
  # end
  resources :suppliers do  
    resources :accounts 
    end
    resources :accounts do
      resources :account_histories
      end  
  get "welcome/index"
  post "map/index"
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  root to: "welcome#index"
  #root to: "map#index"
end