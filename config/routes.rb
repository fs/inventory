Inventory::Application.routes.draw do |map|
  devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout' }
  match 'login', :to => 'devise/sessions#new', :as => 'new_user_session'
  match 'logout', :to  => 'devise/sessions#destroy', :as => 'destroy_user_session'
  match 'signup', :to => 'devise/registrations#new', :as => 'new_user_registration'

  resources :units
  resources :rooms
  root :to => 'home#index'
end
