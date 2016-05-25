#
# Cookbook Name:: optoro_ruby
# Recipe:: default
#
# Copyright (C) 2014 Optoro Inc
#
# All rights reserved - Do Not Redistribute

# Update package index
include_recipe 'apt'

# Build from source or create debian package
if node['optoro_ruby']['install_method']
  include_recipe "optoro_ruby::_#{node['optoro_ruby']['install_method']}"
end
