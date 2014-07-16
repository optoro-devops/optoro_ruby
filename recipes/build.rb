# Recipe: install
# Description: Contains source install related tasks.

include_recipe "build-essential"

# Install packages for building ruby
node[:optoro_ruby][:source_dependencies].each do |pkg|
  package pkg do
    action :install
  end
end

# Download ruby from URL
remote_file "/tmp/#{node[:optoro_ruby][:source_name]}" do
  source node[:optoro_ruby][:download_url]
  checksum node[:optoro_ruby][:source_sha256_sum]
  notifies :run, "execute[extract_ruby]", :immediately
  action :create_if_missing
end

# Extract ruby
execute "extract_ruby" do
  command "tar zxf #{node[:optoro_ruby][:source_name]}"
  cwd "/tmp"
  action :nothing
  not_if { Dir.exist?(node[:optoro_ruby][:source_directory]) }
end

# Install from source or build package from source
# Install methods: build_source, build_package
include_recipe "optoro_ruby::#{node[:optoro_ruby][:install_method]}"
