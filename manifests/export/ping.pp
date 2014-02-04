class nagios-client::export::ping {
    
  include nagios-client::defaults

  @@nagios_service { "${::fqdn}-check_ping":
    use       => 'check_ping',
    host_name => $::fqdn,
    target    => "$defaults::resource_dir/check_ping/${::fqdn}.cfg",
    ## require   => Nagios-server::Config_update[$::fqdn, 'service', 'check_ping'],
  }

}
