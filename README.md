# consul Chef Cookbook

Installs and starts [Consul][1] Agent.

## Supported Platforms

At this point cookbook supports only CentOS 6.6

## Attributes

The following attributes affect the behavior of the Consul Agent.

* `node['consul']['version']` - sets Consul version
* `node['consul']['url']` - url to download a Cunsul package
* `node['consul']['config_dir']` - sets the full path to put Consul configuration
* `node['consul']['data_dir']` - sets the full path to data directory - Consul will use this to store information about the cluster state
* `node['consul']['install_dir']` - sets path where we will keep the executable
* `node['consul']['service_mode']` - sets Consul configuration, default: `client`
* `node['consul']['bootstrap_expect']` - This option informs Consul of the expected number of server nodes and automatically bootstraps when that many servers are available. Used in `cluster` mode.
* `node['consul']['servers']` - An array of Consul servers to join, needed for `client` and `cluster` modes
* `node['consul']['gomaxprocs']` - you can tweak this value but recommended and default is set to CPU number
* `node['consul']['datacenter']` - controls the datacenter in which the agent is running, by default is sets as `node.chef_environment`

## Recipes

### consul::default

The default recipe installs, configures and starts Consul Agent in client mode.

    include_recipe[consul]

### consul::bootstrap

The bootstrap recipe installs, configures and starts Consul Agent in bootstrap mode.

    include_recipe[consul::bootstrap]

### consul::cluster

The cluster recipe installs, configures and starts Consul Agent in cluster mode.

    include_recipe[consul::cluster]

## License and Authors

Author:: Krzysztof Szarek

[1]: https://www.consul.io/intro