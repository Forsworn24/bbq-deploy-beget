source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'aws-sdk-s3'
gem 'bootsnap', require: false
gem 'devise'
gem 'devise-i18n'
gem 'dotenv-rails'
gem 'image_processing', '~> 1.0'
gem 'jbuilder', '~> 2.7'
gem 'mailjet'
gem 'net-smtp', require: false
gem 'net-imap', require: false
gem 'net-pop', require: false
gem 'puma', '~> 5.0'
gem 'pundit', '~> 2.2'
gem 'rails', '~> 6.1.4', '>= 6.1.4.4'
gem 'rails-i18n', '~> 6.0'
gem 'resque'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'omniauth'
gem 'omniauth-github', github: 'omniauth/omniauth-github', branch: 'master'
gem 'omniauth-rails_csrf_protection'
gem 'omniauth-google-oauth2'
# gem 'open-uri'
gem 'webpacker', '~> 5.0'


group :production do
  gem 'pg'
end

group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'factory_bot_rails'
  gem 'sqlite3'
  gem "letter_opener"
end

group :development do
  gem 'capistrano', '3.17.1'
  gem 'capistrano-rails'
  gem 'capistrano-passenger', '~> 0.2'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-resque', require: false
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'rspec-rails'
  gem 'rspec-core'
  gem 'ed25519'
  gem 'bcrypt_pbkdf'
end
