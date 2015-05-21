#
# Cookbook Name:: consul
# Recipe:: default
#
# Copyright (C) 2015 Krzysztof Szarek
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
include_recipe 'consul::_install'

template "#{node['consul']['config_dir']}/config.json" do
  source 'bootstrap.json.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(servers: node['consul']['servers'] - [node['hostname']])
  notifies :reload, 'service[consul]'
end

include_recipe 'consul::_configure_service'
