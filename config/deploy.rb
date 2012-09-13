require 'torquebox-capistrano-support'
require 'bundler/capistrano'

# version control
set :application,       "fairworks.net"
set :scm,               :git
set :repository,        "git@github.com:josmar52789/fairworks.net.git" # your repo location
set :branch,            "master"
set :git_shallow_clone, 1
set :scm_verbose,       true
set :use_sudo,          false

# production setup
set :user,              "emi" # your server username
set :deploy_to,         "/home/emi/webapps/#{application}"
set :torquebox_home,    "/home/emi/torquebox-current"

role :web,              "192.168.100.21" # location of the web server
role :app,              "192.168.100.21" # may be the same as your 'Web' server
role :db,               "192.168.100.21", :primary => true # where Rails migrations will run, NOT the location of the db

# necesary or else a '/usr/bin/env: jruby: No such file or directory' will occur
set :default_environment, {
  'PATH' => "/home/emi/torquebox-current/jruby/bin:$PATH"
}
