require 'spec_helper'

describe file('/root/nat_monitor.sh') do
  it { should be_executable }
end

describe file('/tmp/nat_monitor.log') do
  it { should be_writable }
  its(:size) {should > 0} #if file is growing then we infer that monitor is running
end

describe service('nat-monitor') do
  it { should be_enabled }
  it { should be_running }
end
