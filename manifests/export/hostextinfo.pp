class nagios-client::export::hostextinfo {
    
  include nagios-client::defaults
  
  export::file{'hostextinfo':}
  
  @@nagios_hostextinfo { $::fqdn:
    ensure          => present,
    icon_image_alt  => $::operatingsystem,
    icon_image      => "base/${::operatingsystem}.png",
    statusmap_image => "base/${::operatingsystem}.gd2",
    target          => "$defaults::resource_dir/hostextinfo/${::fqdn}.cfg",
    require         => Export::file['hostextinfo'],
  }
}
