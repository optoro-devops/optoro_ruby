# Recipe: source
# Description: Install ruby from source

# Compile and install ruby
major_version = node[:optoro_ruby][:ruby_major_version]
minor_version = node[:optoro_ruby][:ruby_minor_version]
params = { major: major_version, minor: minor_version }
source_directory = node[:optoro_ruby][:source_directory] % params

execute "install_ruby" do
  command "./configure && make && make install"
  cwd source_directory
  not_if { File.exist?("/usr/local/bin/ruby") }
  subscribes :run, "execute[extract_ruby]", :immediately
  action :nothing
end

# Install bundler
include_recipe "optoro_ruby::bundler"
