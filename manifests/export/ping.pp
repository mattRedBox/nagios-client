class nagios-client::export::ping {
    
  include nagios-client::defaults

  export::file{'check_ping':}
  
  @@nagios_service { "${::fqdn}-check_ping":
    use       => 'check_ping',
    host_name => $::fqdn,
    target    => "$defaults::resource_dir/check_ping/${::fqdn}.cfg",
    require   => Export::File['check_ping'],
  }

}
