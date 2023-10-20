set :rails_env, "production"

server "asr-sessions-prd-02.oit.umn.edu",
  roles: %w[web app db prod]
