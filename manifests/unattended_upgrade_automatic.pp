class apt::unattended_upgrade_automatic inherits apt::unattendedr_upgrade {
  apt::conf{"99unattended-upgrade":
    ensure  => present,
    content => "APT::Periodic::Unattended-Upgrade \"1\";\n",
  }

  apt::conf{"50unattended-upgrades":
    ensure => present,
    source => "puppet:///modules/apt/unattended-upgrades.${debian::release}",
  }
}
