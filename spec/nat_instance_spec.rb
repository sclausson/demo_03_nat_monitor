require 'spec_helper'

describe file('/root/nat_monitor.sh') do
  it { should be_executable }
end

describe file('/tmp/nat_monitor.log') do
  it { should be_writable }
  its(:size) {should > 0}
end

describe process("/root/nat_monitor.sh") do 
  it { should_be running }
end
