include_recipe 'rvm::system_install'

bash 'install default ruby' do
  code "rvm install #{node['optoro_ruby']['default_binary_ruby']} --binary"
  flags '--login'
end


%w( bundler rake ).each do |gem|
  gem_package gem do
    action :install
  end
end
