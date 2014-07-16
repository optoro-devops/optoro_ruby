# Recipe: source
# Description: Install ruby from source

# Compile and install ruby
execute "install_ruby" do
  command "./configure && make && make install"
  cwd node[:optoro_ruby][:source_directory]
  not_if { File.exist?("/usr/local/bin/ruby") }
  subscribes :run, "execute[extract_ruby]", :immediately
  action :nothing
end

# Install bundler
include_recipe "optoro_ruby::bundler"
