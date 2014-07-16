# Recipe: build_package
# Description: This recipe will build a (good enough) ruby debian package for
# the specified version of ruby.

# Install packages for building a debian file.
node[:optoro_ruby][:debian_build_dependencies].each do |dep|
  package dep do
    action :install
  end
end

# Create correct ruby directory structures
execute "debianize_ruby_source" do
  command "yes | dh_make -f ../ruby-#{node[:optoro_ruby][:ruby_full_version]}.tar.gz -s"
  cwd node[:optoro_ruby][:source_directory]
  action :run
  not_if { Dir.exist?("#{node[:optoro_ruby][:source_directory]}/debian") }
end

# Install debian related templates (control files, etc)
%w{ control changelog copyright }.each do |file|
  template "#{node[:optoro_ruby][:source_directory]}/debian/#{file}" do
    source "#{file}.erb"
    action :create
  end
end

# build Debian package
execute "build_package" do
  command "dpkg-buildpackage"
  cwd node[:optoro_ruby][:source_directory]
  action :run
end

# Upload package to S3?
