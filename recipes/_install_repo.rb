# Recipe: _install_repo
# Description: Install ruby from repo
#
apt_repository 'brightbox' do
  action :add
  uri 'http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu/'
  distribution 'trusty'
  components ['main']
  arch 'amd64'
  key 'C3173AA6'
  keyserver 'keyserver.ubuntu.com'
  notifies :run, 'execute[apt-get update]', :immediately
end

execute 'apt-cache gencaches' do
  ignore_failure true
  action :nothing
end

execute 'apt-get update' do
  command 'apt-get update'
  ignore_failure true
  action :nothing
  notifies :run, 'execute[apt-cache gencaches]', :immediately
end

package "ruby#{node['optoro_ruby']['ruby_major_version']}"

# Install bundler
include_recipe 'optoro_ruby::_bundler'
