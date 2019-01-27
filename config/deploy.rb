# config valid only for current version of Capistrano
lock "3.11.0"

set :application, "testcodelinux"
set :repo_url, "git@github.com:doantutai/testcode.git"

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
set :pty, true

# set :ssh_options, {
#  forward_agent: false
# }

set :linked_files, fetch(:linked_files, []).push(
  '.env',
  'web/.htaccess'
)

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :linked_dirs, %w{
  web/app/uploads
}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :local_url, 'beauty-health.sstechvn.com'

namespace :deploy do
    task :link_plugins do
      on roles(:web), in: :groups, limit: 3, wait: 10 do
        cmds = [
          "rm -rf #{release_path}/web/wp/wp-content/plugins",
          "ln -s #{release_path}/web/app/plugins #{release_path}/web/wp/wp-content/plugins"
        ]
        #execute cmds.join(" && ")
      end
    end

    before :publishing, :link_plugins

end
