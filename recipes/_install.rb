version = node['consul']['version']
remote_file "#{Chef::Config[:file_cache_path]}/consul-#{version}.zip" do
  source node['consul']['url']
end

directory '/opt/consul'
directory node['consul']['config_dir']
directory node['consul']['data_dir']
package 'unzip'

execute 'unzip' do
  command "unzip #{Chef::Config[:file_cache_path]}/consul-#{version}.zip " \
          "-d /opt/consul/#{version}"
  action :run
  not_if "test -f /opt/consul/#{version}/consul"
end

link "#{node['consul']['install_dir']}/consul" do
  to "/opt/consul/#{version}/consul"
end
