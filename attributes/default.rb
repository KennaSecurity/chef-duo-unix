# where are our secrets stored?
default['duo-unix']['vault']                        = 'duo'
default['duo-unix']['vault_item']                   = 'config'

# please use chef-vault instead
default['duo-unix']['api']['ikey']              = nil
default['duo-unix']['api']['skey']              = nil
default['duo-unix']['api']['host']              = nil

# source
default['duo-unix']['from_source']                  = true
default['duo-unix']['src']['version']               = "1.9.18"
default['duo-unix']['src']['url']                   = "https://dl.duosecurity.com/duo_unix-#{node['duo-unix']['src']['version']}.tar.gz"
default['duo-unix']['src']['checksum']              = "2eb11dff0a173c62e318587c50faec717e8889fbb6bb2d076e4f31999f9107ae"

# login_duo config
default['duo-unix']['conf']['groups']               = nil
default['duo-unix']['conf']['failmode']             = 'safe'
default['duo-unix']['conf']['pushinfo']             = 'no'
default['duo-unix']['conf']['http_proxy']           = nil
default['duo-unix']['conf']['autopush']             = 'yes'
default['duo-unix']['conf']['motd']             	= 'no'
default['duo-unix']['conf']['prompts']             	= '1'
default['duo-unix']['conf']['accept_env_factor']    = 'no'
default['duo-unix']['conf']['fallback_local_ip']    = 'no'
default['duo-unix']['conf']['https_timeout']    	= '0'

# sshd config
default['duo-unix']['sshd']['force_command']        = '/usr/sbin/login_duo'
default['duo-unix']['sshd']['permit_tunnel']        = 'no'
default['duo-unix']['sshd']['allow_tcp_forwarding'] = 'no'