class nagios-client::export::host {
    
  include nagios-client::defaults

  export::update_config{$::fqdn:
    nagios_resource => 'host',
  }

  @@nagios_host { $::fqdn:
    ensure  => present,
    alias   => $hostname,
    address => $ipaddress,
    use     => 'linux-server',
    target  => "$defaults::resource_dir/host/${::fqdn}.cfg",
  }
  
}
