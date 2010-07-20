Inventory::Application.routes.draw do
  devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout' }
  match 'login', :to => 'devise/sessions#new', :as => 'new_user_session'
  match 'logout', :to  => 'devise/sessions#destroy', :as => 'destroy_user_session'
  match 'signup', :to => 'devise/registrations#new', :as => 'new_user_registration'

  resources :units do
    get :on_depot, :on => :collection
  end
  
  resources :users do
    resources :units, :controller => 'user_units', :only => [:index, :create, :destroy]
  end
  
  resources :rooms
  root :to => 'home#index'

  match "/env1" => proc { |env| [200, {'Content-Type' => 'text/plain'}, Rack::Request.new(env).inspect] }
  match "/env2" => proc { |env| [200, {'Content-Type' => 'text/plain'}, Rack::Request.new(env).ip.inspect] }
  match "/env3" => proc { |env| [200, {'Content-Type' => 'text/plain'}, env.inspect] }
end
