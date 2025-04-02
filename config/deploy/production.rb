# frozen_string_literal: true

set :stage, :production
set :rails_env, :production
set :branch, "master"

# Deploy to the user's home directory
set :deploy_to, "/home/deploy/#{fetch :application}"

# server info
server "139.162.12.200", user: "deploy", roles: %w{app db web}

#env file
set :linked_files, fetch(:linked_files, []).push('.env.production')