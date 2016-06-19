class apt::multimedia {

  apt::sources_list { debian-multimedia:
    content => "deb http://www.deb-multimedia.org $debian::release main"
  }

  apt::key_local { multimedia:
    key => "65558117",
    source => "puppet:///modules/apt/multimedia.key"
  }

}
