#
# Cookbook Name:: duo-unix
# Recipe:: source
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

include_recipe 'build-essential::default'

case node[:platform]
when 'debian', 'ubuntu'
  package 'libssl-dev'
when 'redhat', 'centos', 'fedora', 'amazon', 'scientific'
  package 'openssl-devel'
end
  
# get source
src_dir = '/usr/local/src/duo_unix'
tarball = '/usr/local/src/duo_unix.tar.gz'
remote_file tarball do
  source   node['duo-unix']['src']['url']
  checksum node['duo-unix']['src']['checksum']
  owner    'root'
  group    'root'
  action   :create_if_missing
end

# compile and install
bash "install_duo_unix" do
  code <<-EOH
  mkdir -p #{src_dir}

  cd #{src_dir}/..
  tar --strip-components 1 -C #{src_dir} -zxf #{tarball}

  cd #{src_dir}
  ./configure --prefix=/usr
  make
  make install
  EOH
  not_if { File.directory? src_dir }
end
