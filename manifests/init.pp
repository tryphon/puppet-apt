class apt($apt_proxy_url = '') {
  include debian

  Package {
    require => Exec["apt_get_update"]
  }

  apt::conf {"10periodic":
    ensure => present,
    source => "puppet:///modules/apt/10periodic",
  }

  exec { "apt_get_update":
    command     => "apt-get update",
    refreshonly => true,
  }

  if $debian::lenny {
    file { "/etc/apt/sources.list":
      content => "deb http://archive.debian.org/debian/ lenny main contrib non-free"
    }
  } else {
    file { "/etc/apt/sources.list":
      content => "deb http://ftp.fr.debian.org/debian/ $debian::release main contrib non-free\ndeb http://security.debian.org/ $debian::release/updates main contrib non-free\n"
    }
  }

  file { "/usr/local/sbin/apt-upgrade":
    source => "puppet:///modules/apt/apt-upgrade"
  }

  include sudo
  sudo::user_line { "apt-upgrade-adm":
    line => "%adm	ALL=(ALL) NOPASSWD: /usr/local/sbin/apt-upgrade"
  }

  if $debian::lenny {
    concatenated_file { "/etc/apt/preferences":
      dir => "/etc/apt/preferences.d",
      before  => Exec["apt_get_update"]
    }
  }

  apt::conf { "02recommended-suggested":
    ensure => present,
    content => "APT::Install-Recommends \"0\";\nAPT::Install-Suggests \"0\";"
  }

  if ($apt_proxy_url!='') {
    apt::conf { "02proxy":
      ensure => present,
      content => "Acquire::http { Proxy \"${apt_proxy_url}\"; };"
    }
  } else {
    apt::conf { "02proxy":
      ensure => absent
    }
  }
}
