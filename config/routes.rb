FairworksCom::Application.routes.draw do

  resources :sessions, :only => [:new, :create, :destroy]
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"

  match 'entrants/search' => "entrants#search"
  resources :entrants

  resources :reports, :only => [:index]
  match 'reports/download_checks' => 'reports#download_checks'

  resources :users
  resources :wins
  resources :prizes
  resources :categories
  resources :departments
  resources :divisions

  root :to => 'browse#dashboard'
end
