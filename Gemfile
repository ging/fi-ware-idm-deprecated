if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

source 'https://rubygems.org'

gem 'rails', '3.2.14'

gem 'mysql2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

group :development do
  gem 'forgery'
  gem 'diffy'
  gem "capistrano", "~> 2.15.5"
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl', '1.3.3'
end

# gem 'omniauth-social_stream', path: '../omniauth-social_stream'

git 'git://github.com/ging/social_stream.git', branch: 'master' do
  gem 'social_stream-base'
  gem 'social_stream-oauth2_server'
end

gem 'pry-rails'

gem 'exception_notification', '~> 3.0'

gem 'rest-client'

# CAPTCHA
gem "galetahub-simple_captcha", :require => "simple_captcha"

# CORS
gem 'rack-cors', require: 'rack/cors'

gem 'sanitize', '= 2.1.0'


# SHIBBOLETH
gem 'omniauth-shibboleth'

# Script
gem 'mysql'

# For carrierwave
gem "mini_magick"

