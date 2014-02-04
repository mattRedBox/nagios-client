class nagios-client::export::ping {
    
  include nagios-client::defaults

  export::update_config{"check_ping-${::fqdn}":
    resource_specific => $::fqdn,
    resource_generic  => 'check_ping',
    nagios_resource   => 'service',
  }

  @@nagios_service { "${::fqdn}-check_ping":
    use       => 'check_ping',
    host_name => $::fqdn,
    target    => "$defaults::resource_dir/check_ping/${::fqdn}.cfg",
  }

}
