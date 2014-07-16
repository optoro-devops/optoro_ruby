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
    expect(command("which ruby")).to return_stdout("/usr/bin/ruby")
  end

  it "gem should be installed" do
    expect(command("which gem")).to return_stdout("/usr/bin/gem")
  end

  it "bundler should be installed" do
    expect(command("which bundler")).to return_stdout("/usr/bin/bundler")
  end

  it "should install the right ruby version" do
    expect(command("ruby -v")).to return_stdout("ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-linux]")
  end
end
