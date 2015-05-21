require 'spec_helper'

describe command('which consul') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match '/usr/local/bin/consul' }
end

describe service('consul') do
  it { should be_enabled }
  it { should be_running }
end

%w(/var/consul /etc/consul.d).each do |dir|
  describe file(dir) do
    it { should be_directory }
  end
end

[8400, 8500, 8600].each do |p|
  describe port(p) do
    it { should be_listening }
  end
end

describe file('/etc/consul.d/config.json') do
  it { should be_file }
end
