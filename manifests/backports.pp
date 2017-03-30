class apt::backports {
  include debian

  if $debian::lenny {
    apt::sources_list { lenny-backports:
      content => "deb http://archive.debian.org/debian-backports lenny-backports main contrib non-free"
    }
  }

  if $debian::squeeze {
    apt::sources_list { squeeze-backports:
      content => "deb http://backports.debian.org/debian-backports squeeze-backports main contrib non-free"
    }
  }

  if $debian::wheezy {
    apt::sources_list { wheezy-backports:
      content => "deb http://http.debian.net/debian wheezy-backports main contrib non-free"
    }
  }

  if $debian::jessie {
    apt::sources_list { jessie-backports:
      content => "deb http://http.debian.net/debian jessie-backports main contrib non-free"
    }
  }

  apt::key_local { backports:
    key => "16BA136C",
    source => "puppet:///modules/apt/backports.key"
  }
}
