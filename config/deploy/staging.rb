set :rails_env, "staging"

server "asr-sessions-qat-02.oit.umn.edu",
  roles: %w[web app db prod]
