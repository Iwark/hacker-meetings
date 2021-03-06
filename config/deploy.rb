# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'Hacker-Meetings'
set :repo_url, 'git@github.com:Iwark/hacker-meetings.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/home/ec2-user/hacker-meetings'

# Default value for :scm is :git
set :scm, :git

set :rbenv_ruby, '2.1.2'

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/secrets.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets}

set :default_stage, "production"

# Default value for default_env is {}
set :default_env, {
  rbenv_root: "/home/ec2-user/rbenv",
  path: "/home/ec2-user/rbenv/shims:/home/ec2-user/rbenv/bin:$PATH",
  secret_key_base: 'f3d0707a11e000a6d103e932650b064decc567d9e468cdb08b7a9351f87c98a6c7654af54a30d20f33d9871e37f6e26ac0eb0e71fac619a3a51d8f5b52594fc5',
  facebook_app_id: '224852424367041',
  facebook_app_secret: '8d95e7e68ee1affcec9f25dfd4ad16d8'
}

# Default value for keep_releases is 5
# set :keep_releases, 5

# set :linked_dirs, (fetch(:linked_dirs) + ['tmp/pids'])

set :unicorn_rack_env, "production"
set :unicorn_config_path, 'config/unicorn.conf'

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do

  desc 'Restart application'
  task :restart do
    # on roles(:app), in: :sequence, wait: 5 do
      invoke 'unicorn:restart'
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    # end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
