class apt::tryphon::dev {
  apt::sources_list { 'tryphon-dev':
    content => "deb http://dev.tryphon.priv/dist/debian/${debian::release}/amd64/ ./",
    require => File["/etc/apt/apt.conf.d/02allow-unauthenticated"]
  }
  file { "/etc/apt/apt.conf.d/02allow-unauthenticated":
    content => "APT::Get::AllowUnauthenticated \"true\";\n"
  }
}
