# Change these
server '104.194.93.50', port: 28570, roles: [:web, :app, :db], primary: true

set :repo_url,        'git@github.com:zty2developer/bootstrap_depot.git'
set :application,     'bootstrap_depot'
set :user,            'deploy'
set :puma_threads,    [4, 16]
set :puma_workers,    0

# Don't change these unless you know what you're doing
set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log,  "#{release_path}/log/puma.error.log"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to false when not using ActiveRecord

set :default_env, {
	'SECRET_KEY_BASE' => '45d6371f1b022a5d3eef38be71f97a3d3be6f040b3d2b3f9510c705cc4ad4f251189d6cc6e7d6f73547fcfa0afbee9014ce198b3f6db3bbff8f81df6379e48d2'
}
set :branch, ENV['BRANCH'] if ENV['BRANCH']
## Defaults:
# set :scm,           :git
# set :branch,        :master
# set :format,        :pretty
# set :log_level,     :debug
# set :keep_releases, 5

## Linked Files & Directories (Default None):
# set :linked_files, %w{config/database.yml}
# set :linked_dirs,  %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :puma do
	desc 'Create Directories for Puma Pids and Socket'
	task :make_dirs do
		on roles(:app) do
			execute "mkdir #{shared_path}/tmp/sockets -p"
			execute "mkdir #{shared_path}/tmp/pids -p"
		end
	end

	before :start, :make_dirs
end

namespace :deploy do
	desc "Make sure local git is in sync with remote."
	task :check_revision do
		on roles(:app) do
			unless `git rev-parse HEAD` == `git rev-parse origin/master`
				puts "WARNING: HEAD is not the same as origin/master"
				puts "Run `git push` to sync changes."
				exit
			end
		end
	end

	desc 'Initial Deploy'
	task :initial do
		on roles(:app) do
			before 'deploy:restart', 'puma:start'
			invoke 'deploy'
		end
	end

	desc 'Restart application'
	task :restart do
		on roles(:app), in: :sequence, wait: 5 do
			invoke 'puma:restart'
		end
	end

	before :starting,     :check_revision
	after  :finishing,    :compile_assets
	after  :finishing,    :cleanup
	after  :finishing,    :restart
end

# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma
