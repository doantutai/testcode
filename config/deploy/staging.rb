server '13.59.34.247', user: 'ubuntu', roles: %w{web app db}
set :deploy_to, "/var/www/testcodelinux/html/#{fetch(:application)}"

set :branch, 'master'
set :tmp_dir, "/tmp"
