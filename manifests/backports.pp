class apt::backports {
  apt::sources_list { lenny-backports:
    content => "deb http://backports.debian.org/debian-backports lenny-backports main contrib non-free"
  }

  apt::key_local { backports:
    key => "16BA136C",
    source => "puppet:///apt/backports.key"
  }
}
