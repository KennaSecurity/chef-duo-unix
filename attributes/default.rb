# where are our secrets stored?
default['duo-unix']['vault']                        = 'duo'
default['duo-unix']['vault_item']                   = 'config'

# please use chef-vault instead
default['duo-unix']['api']['ikey']              = nil
default['duo-unix']['api']['skey']              = nil
default['duo-unix']['api']['host']              = nil

# source
default['duo-unix']['from_source']                  = true
default['duo-unix']['src']['version']               = "1.9.7"
default['duo-unix']['src']['url']                   = "https://dl.duosecurity.com/duo_unix-#{node['duo-unix']['src']['version']}.tar.gz"
default['duo-unix']['src']['checksum']              = "f200ea5accf3eafce66568ecb6f9f99634e84fac987bc06df11bd21e6dea1324"
# login_duo config
default['duo-unix']['conf']['group']                = nil
default['duo-unix']['conf']['failmode']             = 'secure'
default['duo-unix']['conf']['pushinfo']             = 'no'
# sshd config
default['duo-unix']['sshd']['force_command']        = '/usr/sbin/login_duo'
default['duo-unix']['sshd']['permit_tunnel']        = 'no'
default['duo-unix']['sshd']['allow_tcp_forwarding'] = 'no'
