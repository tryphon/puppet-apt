class apt::multimedia {

  apt::sources_list { debian-multimedia:
    content => "deb http://www.debian-multimedia.org $lsbdistcodename main"
  }

  apt::key_local { multimedia:
    key => "1F41B907",
    source => "puppet:///apt/multimedia.key"
  }

}
