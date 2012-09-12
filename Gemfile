source 'http://rubygems.org'

gem 'rails', '~> 3.2.8'

# torquebox
gem "torquebox", "2.0.3"
gem "torquebox-rake-support", "2.0.3"
gem "torquebox-capistrano-support", "2.0.3"
gem 'jruby-openssl'

# assets
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'therubyrhino'
  
  gem 'uglifier'
  gem 'json'
  gem 'jquery-rails'
end

gem 'haml'
gem 'linguistics'

group :development do
  gem 'activerecord-jdbcsqlite3-adapter'
  gem 'bcrypt-ruby' # To use ActiveModel has_secure_password
end

group :production do
  gem 'activerecord-jdbcmssql-adapter'
end

# paging
gem 'kaminari'

# currency
gem 'money'

# pdf (check) generation
gem 'prawn'

gem 'capistrano'