class apt::tryphon {
  apt::sources_list { tryphon:
    content => "deb http://debian.tryphon.eu lenny main contrib
deb http://debian.tryphon.eu lenny-backports main contrib
"
  }

  apt::key { "C6ADBBD5":
    source => "http://debian.tryphon.eu/release.asc"
  }
}
