default['consul']['version'] = '0.5.0'
default['consul']['checksum'] = '161f2a8803e31550bd92a00e95a3a517aa' \
                                '949714c19d3124c46e56cfdc97b088'
default['consul']['url'] = 'https://dl.bintray.com/mitchellh/' \
                           "consul/#{node['consul']['version']}_linux_amd64.zip"
default['consul']['config_dir'] = '/etc/consul.d'
default['consul']['data_dir'] = '/var/consul'
default['consul']['install_dir'] = '/usr/local/bin'
default['consul']['service_mode'] = 'bootstrap'
default['consul']['bootstrap_expect'] = 3
default['consul']['servers'] = []
default['consul']['gomaxprocs'] = node['cpu']['total']
