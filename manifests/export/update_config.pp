define nagios-client::export::update_config($resource_specific=$title, $nagios_resource, $resource_generic=$nagios_resource) {
  ## resource_specific = fqdn
  ## resource_generic = host, hostextinfo, check_ping
  ## nagios_resource = host, hostextinfo, service
  
  include nagios-client::defaults

  @@file { "${::fqdn}_${resource_generic}":
    path    => "${defaults::resource_dir}/${resource_generic}",
    ensure  => directory,
    owner   => 'nagios',
    group   => 'nagios',
  }

  @@file_line { "${::fqdn}_${resource_generic}":
    path    => "${defaults::config_dir}/nagios.cfg",
    line    => "cfg_dir=${defaults::resource_dir}/${resource_generic}",
  }
}
