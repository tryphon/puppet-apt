class apt::multimedia {

  apt::sources_list { debian-multimedia:
    content => "deb http://www.deb-multimedia.org $debian::release main"
  }

  apt::key_local { multimedia:
    key => "1F41B907",
    source => "puppet:///apt/multimedia.key"
  }

}
