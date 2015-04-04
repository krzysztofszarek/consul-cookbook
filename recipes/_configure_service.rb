template '/etc/init.d/consul' do
  source 'consul-init.erb'
  owner 'root'
  group 'root'
  mode '0750'
end

service 'consul' do
  supports status: true, restart: true, reload: true
  action [:start, :enable]
end
