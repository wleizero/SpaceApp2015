source 'https://rubygems.org'
ruby '2.2.0'


gem 'rails'

# Tree structures
gem 'ancestry'

gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder'


gem "bower-rails"

gem 'inline_svg'

# Bootstrap
gem 'bootstrap-sass'
gem "therubyracer"
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "twitter-bootstrap-rails"
gem 'bootstrap-editable-rails'

# Notifications
gem 'j_growl_rails'

gem 'figaro'
gem 'haml-rails'
gem 'high_voltage'
gem 'simple_form'

gem 'devise'

# State machine
gem 'aasm'

# JS History API management
gem "historyjs-rails"

# JS carousel
gem 'owlcarousel-rails'

gem 'cancan'
gem 'merit'

gem 'friendly_id'

gem 'RedCloth'

gem 'octokit'

gem 'newrelic_rpm'

gem 'thumbs_up'

gem 'omniauth'
gem 'omniauth-facebook'

gem 'activerecord-session_store', github: 'rails/activerecord-session_store'

# Bitcoin
gem 'blockchain-wallet'
gem 'block_io'

gem 'fog'
gem 'carrierwave'
gem "nested_form"
gem "rmagick", :require => 'RMagick'

gem 'twitter'
gem 'gravatar-ultimate'

gem 'pg'

# Random words
gem 'bazaar'

# pre-populate angular template cache
gem 'angular-rails-templates'

gem "puma"

group :test do
  gem 'factory_girl_rails'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'rspec'

  gem 'pry-byebug'

  gem 'capybara'
  gem 'capybara-webkit'
end

group :development do
  gem 'guard-zeus'
  gem 'guard-cucumber'
  
  # Fake data
  gem 'faker'
  
  # Emails open in a browser instead
  gem "letter_opener"

  gem 'html2haml'
  
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard-bundler'
  gem 'guard-rspec'
  
  gem 'quiet_assets'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false

  gem 'rails-dev-boost'
end
group :production do
  gem 'rails_12factor'
  gem "rails_serve_static_assets"
  gem "rails_stdout_logging"
end
