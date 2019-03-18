# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'sessions_data_service'
set :repo_url, 'git@github.com:umn-asr/sessions_data_service.git'
set :user, 'swadm'

ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

set :deploy_to, '/swadm/www/sessions.umn.edu'
set :web_root, "#{fetch(:deploy_to)}"

set :linked_dirs, %w(bin log tmp/cache vendor/bundle)
set :linked_files, %w{config/database.yml config/initializers/environment_variables.rb}

set :passenger_restart_with_touch,  true

set :ssh_options,
    user: fetch(:user),
    forward_agent: true,
    auth_methods: %w(publickey)

set :role, :web
set :logrotate_role, :web
set :logrotate_conf_path, -> { File.join('/swadm/etc', 'logrotate.d', "#{fetch(:application)}_#{fetch(:stage)}") }
set :logrotate_log_path, -> { File.join(shared_path, 'log') }

after :published, 'logrotate:config'
