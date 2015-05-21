name 'consul'
maintainer 'Krzysztof Szarek'
maintainer_email 'kszarek@gmail.com'
license 'Apache 2.0'
description 'Installs/Configures Consul Agent'
long_description 'Installs/Configures Consul Agent'
version '0.2.0'
depends 'monit-ng'

supports 'centos', '= 6.6'
supports 'ubuntu', '= 14.04'

recipe 'consul', 'Installs and starts Consul Agent.'
