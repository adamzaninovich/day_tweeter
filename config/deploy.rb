require "bundler/capistrano"

load "config/deploy/base"
load "config/deploy/nginx"
load "config/deploy/unicorn"
load "config/deploy/postgresql"
load "config/deploy/nodejs"
load "config/deploy/rbenv"
load "config/deploy/check"

server 'daytweeter.adamzaninovich.com', :web, :app, :db, primary: true

set :user, 'deployer'
set :application, 'day_tweeter'
set :domain_name, 'daytweeter.adamzaninovich.com'
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, 'git'
set :repository, "git@github.com:adamzaninovich/#{application}.git"
set :remote, 'github'
set :branch, 'master'

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after 'deploy', 'deploy:cleanup' # keep only the last 5 releases
