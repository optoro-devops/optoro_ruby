# Recipe: install_package
# Description: Installs ruby from pre-built package.

major_version = node['optoro_ruby']['ruby_major_version']
minor_version = node['optoro_ruby']['ruby_minor_version']
params = { major: major_version, minor: minor_version }
full_version = format(node['optoro_ruby']['ruby_full_version'], params)
download_url = format(node['optoro_ruby']['s3_download_url'], params)
package_location = format('/tmp/ruby_%{full_version}', full_version: full_version)
package = format('ruby-%{full_version}', full_version: full_version)

# Install ruby dependencies
node['optoro_ruby']['source_dependencies'].each do |dep|
  package dep do
    action :install
  end
end

# Download package from S3 and verify SHA.
remote_file package_location do
  source download_url
  checksum node['optoro_ruby']['package_256_sha']
  action :create_if_missing
end

dpkg_package package do
  source package_location
  action :install
end

# Install bundler
include_recipe 'optoro_ruby::bundler'
