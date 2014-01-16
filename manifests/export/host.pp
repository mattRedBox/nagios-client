class nagios-client::export::host {
    
  include nagios-client::defaults

  @@nagios_host { $::fqdn:
    ensure  => present,
    alias   => $hostname,
    address => $ipaddress,
    use     => 'linux-server',
    target  => "$defaults::resource_dir/host/${::fqdn}.cfg",
    require => Nagios-server::Config_update[$::fqdn, 'host'],
  }
  
}
