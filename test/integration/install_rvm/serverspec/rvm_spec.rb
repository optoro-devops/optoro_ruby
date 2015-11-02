require 'spec_helper'

describe 'Ruby executeables' do
  describe file('/usr/local/rvm/rubies/ruby-2.1.5/bin/ruby') do
    it { should be_file }
  end

  describe file('/usr/local/rvm/rubies/ruby-2.1.5/bin/gem') do
    it { should be_file }
  end

  describe file('/usr/local/rvm/gems/ruby-2.1.5@global/bin/bundler') do
    it { should be_file }
  end

  describe file('/usr/local/rvm/rubies/ruby-2.1.5/bin/rake') do
    it { should be_file }
  end

end
