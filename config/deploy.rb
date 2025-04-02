# frozen_string_literal: true

#repo
set :application, "shortening"
set :repo_url, "git@github.com:spottran2001/shortening.git"

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'

# rbenv
set :rbenv_type, :user
set :rbenv_ruby, '3.1.2'

# if you don't want to use ENV variables
set :linked_files, %w(config/database.yml config/master.key)

# Only keep the last 5 releases to save disk space
set :keep_releases, 5
