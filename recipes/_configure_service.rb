case node['platform_family']
when 'rhel', 'fedora'
  start_consul = '/etc/init.d/consul start'
  stop_consul = '/etc/init.d/consul stop'
  init_path = '/etc/init.d/consul'
when 'debian'
  start_consul = '/sbin/start consul'
  stop_consul = '/sbin/stop consul'
  init_path = '/etc/init/consul.conf'
end

template init_path do
  source 'consul-init.erb'
  owner 'root'
  group 'root'
  mode '0750'
  notifies :restart, 'service[consul]'
end

service 'consul' do
  supports status: true, restart: true, reload: true
  action [:start, :enable]
end

include_recipe 'monit-ng'

monit_check 'consul' do
  check_id '/var/run/consul.pid'
  group 'consul'
  start start_consul
  stop stop_consul
  tests [
    {
      'condition' => '3 restarts within 5 cycles',
      'action'    => 'alert'
    }
  ]
end
