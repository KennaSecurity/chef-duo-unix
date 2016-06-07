#
# Cookbook Name:: duo-unix
# Recipe:: default
#
# Copyright 2014, Risk I/O
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'apt' if ['ubuntu', 'debian'].include? node[:platform]
include_recipe 'chef-vault'

# determine install method
if node['duo-unix']['from_source']
  include_recipe 'duo-unix::source'
else
  # TODO: duo only supports certain releases of each OS
  # case node[:platform]
  # when 'debian', 'ubuntu'
  #   include_recipe 'duo-unix::apt'
  # when 'redhat', 'centos', 'fedora'
  #   include_recipe 'duo-unix::yum'
  # end
end

# configure login_duo
duo_api   = chef_vault_item(node['duo-unix']['vault'],node['duo-unix']['vault_item']) rescue nil
duo_api ||= node['duo-unix']['api']

duo_conf = duo_api.merge(node['duo-unix']['conf'])

template "/etc/duo/login_duo.conf" do
  mode 0600
  variables(duo_conf)
end

# configure openssh to use login_duo
node.default['openssh']['server'].merge!(node['duo-unix']['sshd'])
include_recipe 'openssh::default'
# TODO: add pam_duo support
