Brainsolve::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  #resources :solutions

  resources :problems

  post '/solutions/:id/choose_solution' => 'solutions#choose_solution', as: :choose_solution
  put '/solutions/notification_check' => 'solutions#notification_check', as: :notification_check


  post	 '/solutions'	=> 'solutions#create'
  
  get '/problems/:id/solutions/new' => 'solutions#new', as: :new_solution
  get '/solutions/:id/edit' => 'solutions#edit', as: :edit_solution
  get '/solutions/:id' => 'solutions#show', as: :solution
  patch 'solutions/:id' => 'solutions#update'
  put 'solutions/:id' => 'solutions#update'
  delete 'solutions/:id' => 'solutions#destroy'


#controlador/vista  =>  controlador#metodo as: nombre

#Rutas para links del Menú
  get 'menu/noticias' => 'menu#noticias' 	
  get 'menu/queesbrainsolve' => 'menu#queesbrainsolve'
  get 'menu/problemas' => 'menu#menuproblemas'
  get 'menu/top10' => 'menu#top10'

  root "problems#index"
  
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
