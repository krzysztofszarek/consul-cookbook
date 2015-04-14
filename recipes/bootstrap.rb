include_recipe 'consul::_install'

template "#{node['consul']['config_dir']}/config.json" do
  source 'bootstrap.json.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :reload, 'service[consul]'
end

include_recipe 'consul::_configure_service'
