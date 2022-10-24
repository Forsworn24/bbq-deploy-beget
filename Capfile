# frozen_string_literal: true

require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git

require 'capistrano/bundler'
require 'capistrano/rbenv' # или RVM
require 'capistrano/rails'
require 'capistrano/passenger'
require 'capistrano-resque'

set :rbenv_type, :user
set :rbenv_ruby, '3.1.2'

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
