# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

role :app, %w{ec2-user@hacker-meetings.com}
role :web, %w{ec2-user@hacker-meetings.com}
role :db,  %w{ec2-user@hacker-meetings.com}

set :stage, :production
set :rails_env, :production
set :secret_key_base, 'f3d0707a11e000a6d103e932650b064decc567d9e468cdb08b7a9351f87c98a6c7654af54a30d20f33d9871e37f6e26ac0eb0e71fac619a3a51d8f5b52594fc5'
set :facebook_app_id, '224852424367041'
set :facebook_app_secret, '8d95e7e68ee1affcec9f25dfd4ad16d8'
# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

# server 'hacker-meetings.com', user: 'deploy', roles: %w{web app}, my_property: :my_value


# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# And/or per server (overrides global)
# ------------------------------------
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
