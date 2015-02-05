# Recipe: install
# Description: Contains source install related tasks.

include_recipe 'build-essential'

# Install packages for building ruby
node['optoro_ruby']['source_dependencies'].each do |pkg|
  package pkg do
    action :install
  end
end

# Download ruby from URL
major_version = node['optoro_ruby']['ruby_major_version']
minor_version = node['optoro_ruby']['ruby_minor_version']
full_version = format('%{major}.%{minor}', major: major_version, minor: minor_version)
source_name = format('ruby-%{full_version}.tar.gz', full_version: full_version)
tar_command = format('tar zxf %{source_name}', source_name: source_name)
download_url = format(node['optoro_ruby']['download_url'], major: major_version, minor: minor_version)
path = format('/tmp/%{source_name}', source_name: source_name)

remote_file path do
  source download_url
  checksum node['optoro_ruby']['source_sha256_sum']
  notifies :run, 'execute[extract_ruby]', :immediately
  action :create_if_missing
end

# Extract ruby
execute 'extract_ruby' do
  command tar_command
  cwd '/tmp'
  action :nothing
  not_if { Dir.exist?(node['optoro_ruby']['source_directory']) }
end

# Install from source or build package from source
# Install methods: build_source, build_package
include_recipe "optoro_ruby::#{node['optoro_ruby']['install_method']}"
