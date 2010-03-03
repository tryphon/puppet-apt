class apt {

  Package {
    require => Exec["apt-get_update"]
  }

  apt::conf {"10periodic":
    ensure => present,
    source => "puppet:///apt/10periodic",
  }

  exec { "apt-get_update":
    command => "apt-get update",
    refreshonly => true,
  }

  file { "/etc/apt/sources.list":
    source => "puppet:///apt/sources.list"
  }

  file { "/usr/local/sbin/apt-upgrade":
    source => "puppet:///apt/apt-upgrade"
  }

  line { "sudo-apt-upgrade-adm":
    file => "/etc/sudoers",
    line => "%adm	ALL=(ALL) NOPASSWD: /usr/local/sbin/apt-upgrade"
  }

  concatenated_file { "/etc/apt/preferences":
    dir => "/etc/apt/preferences.d",
    before  => Exec["apt-get_update"]
  }

  if ($apt_proxy_url) {
    apt::conf { "02proxy":
      ensure => present,
      content => "Acquire::http { Proxy \"${apt_proxy_url}\"; };"
    }
  }
}
