class apt::tryphon {
  include debian

  $real_apt_tryphon_host = $apt_tryphon_host ? {
    default => $apt_tryphon_host,
    '' => "debian.tryphon.eu"
  }

  # TODO Merge when squeeze-backports will be created
  if $debian::lenny {
    apt::sources_list { tryphon:
      content => "deb http://$real_apt_tryphon_host lenny main contrib\ndeb http://$real_apt_tryphon_host lenny-backports main contrib\n",
      require => Apt::Key["C6ADBBD5"]
    }
  } else {
    apt::sources_list { tryphon:
      content => "deb http://$real_apt_tryphon_host ${debian::release} main contrib\n",
      require => Apt::Key["C6ADBBD5"]
    }
  }

  apt::key { "C6ADBBD5":
    source => "http://$real_apt_tryphon_host/release.asc"
  }
}

class apt::tryphon::dev {
  apt::sources_list { 'tryphon-dev':
    content => "deb http://dev.tryphon.priv/dist/debian/${debian::release}/amd64/ ./",
    require => File["/etc/apt/apt.conf.d/02allow-unauthenticated"]
  }
  file { "/etc/apt/apt.conf.d/02allow-unauthenticated":
    content => "APT::Get::AllowUnauthenticated \"true\";\n"
  }
}
