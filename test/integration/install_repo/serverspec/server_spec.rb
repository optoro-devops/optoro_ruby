require 'spec_helper'

describe 'Ruby executeables' do
  describe command('which ruby') do
    its(:stdout) { should match('/usr/bin/ruby') }
  end

  describe command('which gem') do
    its(:stdout) { should match('/usr/bin/gem') }
  end

  describe command('which bundler') do
    its(:stdout) { should match('/usr/local/bin/bundler') }
  end

  describe command('ruby -v') do
    its(:stdout) { should match('ruby 2.1') }
  end
end
