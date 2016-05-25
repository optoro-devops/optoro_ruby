# Recipe: build_package
# Description: This recipe will build a (good enough) ruby debian package for
# the specified version of ruby.

# Install prerequisites
include_recipe 'optoro_ruby::_build'

# Install packages for building a debian file.
node['optoro_ruby']['debian_build_dependencies'].each do |dep|
  package dep do
    action :install
  end
end

# Create correct ruby directory structures
major_version = node['optoro_ruby']['ruby_major_version']
minor_version = node['optoro_ruby']['ruby_minor_version']
params = { major: major_version, minor: minor_version }
full_version = format('%{major}.%{minor}', params)
package_command = format('yes | dh_make -f ../ruby-%{major}.%{minor}.tar.gz -s', params)
source_directory = format('/tmp/ruby-%{major}.%{minor}', params)

execute 'debianize_ruby_source' do
  command package_command
  cwd source_directory
  action :run
  not_if { Dir.exist?("#{source_directory}/debian") }
end

# Install debian related templates (control files, etc)
%w( control copyright ).each do |file|
  template "#{source_directory}/debian/#{file}" do
    source "#{file}.erb"
    action :create
  end
end

template "#{source_directory}/debian/changelog" do
  source 'changelog.erb'
  action :create
  variables(version: full_version)
end

# build Debian package
execute 'build_package' do
  command 'dpkg-buildpackage'
  cwd source_directory
  action :run
end

# Upload package to S3?
