require 'serverspec'

# Required by serverspec
set :backend, :exec

describe service('sshd') do
  it { should be_running }
end

describe file('/usr/sbin/login_duo') do
  it { should exist }
  it { should be_executable }
end

describe file('/etc/ssh/sshd_config') do
  its(:content) { should contain "ForceCommand /usr/sbin/login_duo" }
  its(:content) { should contain "PermitTunnel no" }
  its(:content) { should contain "AllowTcpForwarding no" }
end

describe file('/etc/duo/login_duo.conf') do
  its(:content) { should contain "ikey = " }
  its(:content) { should contain "prompts = 1" }
  its(:content) { should contain "autopush = yes" }
end