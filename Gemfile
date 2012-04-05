source 'http://rubygems.org'

gem 'rails', '~> 3.2.0'
#gem 'hassle3'  # to make Sass play nicely with Heroku - (may not be needed on Cedar stack)

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'uglifier'
  #gem 'therubyracer'  # should not be used on cedar stack
end

# one user said this gem needed to be moved outside of :assets group
# http://stackoverflow.com/questions/7464900/what-needs-to-be-configured-for-heroku-to-handle-templates-based-on-coffeescript
gem 'coffee-rails'

# asset templates
gem 'jquery-rails'
gem 'haml'  # heroku deployment failed until I moved this out of :development, :test group
gem 'haml-rails'

group :development, :test do
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'simplecov', :require => false
  gem 'sqlite3'
  gem 'sqlite3-ruby', :require => 'sqlite3'
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