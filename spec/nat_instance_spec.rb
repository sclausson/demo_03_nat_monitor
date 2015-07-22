require 'spec_helper'

describe file('/usr/bin/nat-monitor') do
  it { should be_executable }
end

describe file('/tmp/nat-monitor.log') do
  it { should be_writable }
  its(:size) {should > 0}
end

describe service('nat-monitor') do
  it { should be_enabled }
  it { should be_running }
end
