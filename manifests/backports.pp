class apt::backports {
  include debian

  if $debian::lenny {
    apt::sources_list { lenny-backports:
      content => "deb http://archive.debian.org/debian-backports lenny-backports main contrib non-free"
    }
  }

  apt::key_local { backports:
    key => "16BA136C",
    source => "puppet:///apt/backports.key"
  }
}
