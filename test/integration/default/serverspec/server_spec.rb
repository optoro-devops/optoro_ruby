# Serverspec tests for rabbitmq sensu configuration
require 'spec_helper'

describe 'Ruby executeables' do
  describe command('which ruby') do
    its(:stdout) { should match('/usr/local/bin/ruby') }
  end

  describe command('which gem') do
    its(:stdout) { should match('/usr/local/bin/gem') }
  end

  describe command('which bundler') do
    its(:stdout) { should match('/usr/local/bin/bundler') }
  end
end
