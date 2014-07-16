# Recipe: bundler
# Description: Install bundler

execute "install_bundler" do
  command "gem install bundler"
  not_if { File.exist?("/usr/local/bin/bundler") }
  action :run
end
