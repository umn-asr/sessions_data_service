role :app, %w{asr-sessions-stage1.oit.umn.edu}

set :server, 'asr-sessions-stage1.oit.umn.edu'

server 'asr-sessions-stage1.oit.umn.edu',
  roles: fetch(:roles),
  web_root: fetch(:web_root),
  ssh_options: {
    user: fetch(:user),
    forward_agent: true,
    auth_methods: %w(publickey)}
