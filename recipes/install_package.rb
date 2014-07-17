# Recipe: install_package
# Description: Installs ruby from pre-built package.

#package_location = "/tmp/ruby_2.1.2-1_amd64.deb"
package_location = "/tmp/ruby_#{optoro_ruby[:ruby_full_version]}-1_amd64.deb"

# Install ruby dependencies
node[:optoro_ruby][:source_dependencies].each do |dep|
  package dep do
    action :install
  end
end

# Download package from S3 and verify SHA.
remote_file package_location do
  source node[:optoro_ruby][:s3_download_url]
  checksum node[:optoro_ruby][:package_2_1_2_256_sha]
  action :create_if_missing
  notifies :run, "execute[install_package]", :immediately
end

# Install package
#execute "install_package" do
#  command "dpkg -i #{package_location}"
#  action :nothing
#end
dpkg_package optoro_ruby[:ruby_full_version] do
  source package_location
  action :install
end

# Install bundler
include_recipe "optoro_ruby::bundler"
