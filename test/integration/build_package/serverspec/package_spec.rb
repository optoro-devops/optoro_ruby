# Serverspec tests for rabbitmq sensu configuration
require 'spec_helper'

describe 'Debian package' do
  it 'should exist' do
    expect(file('/tmp/ruby_2.0.0-p481-1_amd64.deb')).to be_file
  end
end
