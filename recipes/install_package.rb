# Recipe: install_package
# Description: Installs ruby from pre-built package.

package_location = "/tmp/ruby_2.1.2-1_amd64.deb"

# Install ruby dependencies
node[:optoro_ruby][:source_dependencies].each do |dep|
  package dep do
    action :install
  end
end

# Download package from S3 and verify SHA.
remote_file package_location do
  source node[:optoro_ruby][:s3_download_url]
  checksum node[:optoro_ruby][:package_2_1_1_256_sha]
  action :create_if_missing
  notifies :run, "execute[install_package]", :immediately
end

# Install package
execute "install_package" do
  command "dpkg -i #{package_location}"
  action :nothing
end

# Install bundler
include_recipe "optoro_ruby::bundler"
