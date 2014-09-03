# Recipe: install_package
# Description: Installs ruby from pre-built package.

#package_location = "/tmp/ruby_2.1.2-1_amd64.deb"
package_location = "/tmp/ruby_%{ruby_full_version}-1_amd64.deb" % { ruby_full_version: node[:optoro_ruby][:ruby_full_version] }
package = "ruby-%{ruby_full_version}" % { ruby_full_version: node[:optoro_ruby][:ruby_full_version] }

# Install ruby dependencies
node[:optoro_ruby][:source_dependencies].each do |dep|
  package dep do
    action :install
  end
end

# Download package from S3 and verify SHA.
remote_file package_location do
  source node[:optoro_ruby][:s3_download_url]
  checksum node[:optoro_ruby][:package_256_sha]
  action :create_if_missing
end

dpkg_package package do
  source package_location
  action :install
end

# Install bundler
include_recipe "optoro_ruby::bundler"
