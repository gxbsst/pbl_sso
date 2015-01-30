set :stage, :release

set :rails_env, 'release'
# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

# role :app, %w{deployer@172.172.172.120}
# role :web, %w{deployer@172.172.172.120}
# role :db,  %w{deployer@172.172.172.120}


# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

# server '172.172.172.120', user: 'deploy', roles: %w{web app}

server '10.10.31.109',
       user: 'deployer',
       roles: %w{web app db whenever},
       ssh_options: {
           user: 'deployer', # overrides user setting above
           #keys: %w(/home/user_name/.ssh/id_rsa),
           #forward_agent: true,
           auth_methods: %w(password),
           password: '51448888'
       }

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
 fetch(:default_env).merge!(rails_env: 'release', jruby_opts: '"-J-Xmx4096m --1.9"')
