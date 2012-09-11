FairworksCom::Application.routes.draw do

  resources :sessions, :only => [:new, :create, :destroy]
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"

  resources :reports, :only => [:index]
  match 'reports/checks' => 'reports#checks'

  resources :users
  resources :wins
  resources :prizes
  resources :entrants
  resources :categories
  resources :departments
  resources :divisions

  root :to => 'browse#dashboard'
end
