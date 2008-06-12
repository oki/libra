ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => 'books'
  
  map.resources :books,
        :collection => {  :search => :post,
                          :search => :get,
                          :loaned => :get,
                          :requested => :get,
                          :available => :get
        },
        :member => {
                      :return => :put,
                      :request => :put
        }
   map.resources :books do |books|
     books.resources :loans
   end
   
  map.resources :users
  map.resource :session
  
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
