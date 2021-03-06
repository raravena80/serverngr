Servermgr::Application.routes.draw do
  resources :servers

  # get   '/login', :to => 'sessions#new', :as => :login
  match '/auth/:provider/callback', :via => :get, :to => 'sessions#create'
  match '/auth/failure', :via => :get, :to => 'sessions#failure'
  get 'logout', :to => 'sessions#destroy'
  match 'bad' => 'sessions#bad', :via => :get, :as => :bad

  # Application home
  get 'home' => 'home#index', :as => :home
  get 'about' => 'home#about', :as => :about
  get 'contact' => 'home#contact', :as => :contact

  #get "sessions/new"
  #get "sessions/create"
  #get "sessions/failure"  # resources :users
  resources :cloud_accounts
  resources :sessions

  resources :users, :id => /[a-z0-9-]*/
  # match 'logout', :to => 'sessions#destroy'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # root 'trials#index'
  root :to => 'welcome#index'
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
