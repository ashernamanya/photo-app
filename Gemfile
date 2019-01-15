source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.8'
# Use sqlite3 as the database for Active Record
ruby ENV['CUSTOM_RUBY_VERSION'] || '2.5.0' # declaring ruby version
#ruby 'RUBY_VERSION', :engine => 'ENGINE', :engine_version => 'ENGINE_VERSION',
  #:patchlevel => 'RUBY_PATCHLEVEL'
# Use SCSS for stylesheets
#gem 'commontator', '~> 4.11.1' #add comments to the articles
gem 'bootstrap-sass', '~> 3.3.7'
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
gem 'will_paginate', '3.0.7' #for pagination
gem 'bootstrap-will_paginate', '0.0.10' #for pagination
gem 'browser'#to be viewed well in the browser
gem 'pg_search'
gem 'responders', '~> 2.0'
gem 'social-share-button'
gem 'faye'
gem 'thin', require: false
gem 'sync'
gem 'private_pub'
gem 'public_activity'
gem 'rails_admin'
# group :assets do
#   gem 'therubyracer'
#   gem 'sass-rails', "  ~> 3.1.0"
#   gem 'coffee-rails', "~> 3.1.0"
#   gem 'uglifier'
# end
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0'

# Use ActiveModel has_secure_password
 gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'
gem 'puma'

# Use Capistrano for deployment
gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'sqlite3', '1.3.13'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do 
  gem 'pg', '~> 0.11'
  gem 'rails_12factor' 
end 
