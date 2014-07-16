# Serverspec tests for rabbitmq sensu configuration
require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS
RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin'
  end
end

describe "Debian package" do
  it "should exist" do
    expect(file("/tmp/ruby_2.1.2-1_amd64.deb")).to be_file
  end
end
