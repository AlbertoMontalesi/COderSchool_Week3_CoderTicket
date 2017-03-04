Rails.application.routes.draw do
  
  root 'events#index'
  get '/upcoming' => 'events#index' 
  get '/sign_up' => 'users#new'
  get 'new_event_ticket_path' => 'tickets#new'
  get 'event_path' => 'events#show'
  get 'venues' => 'venues#index'
  resources :sessions, only: [:new, :create]
  delete 'logout' => 'sessions#destroy'
  get "/events/show_mine" => 'events#show_mine' #display my events

  resource :venues
  resources :users
  resources :events do
    collection do
      get :search
      get :show_mine
      get :edit
    end
    member do #target a single event so we put in member
      get :publish
    end
    resources :tickets
    #resources :orders  
  
 
  
  
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
