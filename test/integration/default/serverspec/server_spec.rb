# Serverspec tests for rabbitmq sensu configuration
require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS
RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin'
  end
end

describe "Ruby executeables" do
  it "ruby should be installed" do
    expect(command("which ruby")).to return_stdout("/usr/local/bin/ruby")
  end

  it "gem should be installed" do
    expect(command("which gem")).to return_stdout("/usr/local/bin/gem")
  end

  it "bundler should be installed" do
    expect(command("which bundler")).to return_stdout("/usr/local/bin/bundler")
  end
end
