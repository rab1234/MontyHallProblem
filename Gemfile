source 'http://rubygems.org'

gem 'rails', '~> 3.2.0'
gem 'sqlite3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'therubyracer'
end

gem 'jquery-rails'

group :development, :test do
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'haml-rails'
  gem 'simplecov', :require => false
end

group :test do
  # Pretty printed test output
  gem 'turn', '< 0.8.3', :require => false # version required to fix incompatibility
                                           # with cucumber, see 
  # http://stackoverflow.com/questions/7719114/rails-3-1-1-and-cucumber-error
  gem 'rspec-rails'
  gem 'ZenTest'
  gem 'cucumber-rails'
  gem 'cucumber-rails-training-wheels'
  gem 'minitest'
  gem 'autotest'
  gem 'autotest-rails-pure'
  gem 'autotest-fsevent'
  gem 'autotest-growl'
  gem 'spork', '~> 0.9.0.rc'
  gem 'webrat'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
end

group :production do
  gem 'pg'
  gem 'thin'
end

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'