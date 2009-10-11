default_run_options[:pty] = true 

set :application, "polanski"
set :repository, "git@github.com:bantic/polanski.git"
set :user, "capistrano"
ssh_options[:forward_agent] = true
set :use_sudo, true
set :scm_verbose, true

set :deploy_to, "/var/www/#{application}"
# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
set :branch, "master"
set :deploy_via, :remote_cache

set :location, "209.20.90.171"

role :app, location
role :web, location
role :db,  location, :primary => true


namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end

# Assumes that the correct database.yml has already been installed on the
# instances.

task :after_update_code, :roles => [ :app ] do
  run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
end