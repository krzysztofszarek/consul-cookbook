default['consul']['version'] = '0.5.2'
default['consul']['url'] = 'https://dl.bintray.com/mitchellh/' \
                           "consul/#{node['consul']['version']}_linux_amd64.zip"
default['consul']['config_dir'] = '/etc/consul.d'
default['consul']['data_dir'] = '/var/consul'
default['consul']['install_dir'] = '/usr/local/bin'
default['consul']['service_mode'] = 'client'
default['consul']['bootstrap_expect'] = 3
default['consul']['servers'] = []
default['consul']['gomaxprocs'] = node['cpu']['total']
default['consul']['datacenter'] = node.chef_environment
