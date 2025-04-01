set :stage, :production
set :rails_env, :production
set :branch, "master"
set :deploy_to, "/home/deploy/deploy/shortening"
server "139.162.12.200", user: "deploy", roles: %w{app db web}
