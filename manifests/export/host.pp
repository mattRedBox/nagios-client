class nagios-client::export::host {
    
  include nagios-client::defaults

  export::file{'host':}
  
  @@nagios_host { $::fqdn:
    ensure  => present,
    alias   => $hostname,
    address => $ipaddress,
    use     => 'linux-server',
    target  => "$defaults::resource_dir/host/${::fqdn}.cfg",
    require => Export::File['host'],
  }
  
}
