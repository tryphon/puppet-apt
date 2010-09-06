class apt::tryphon {
  apt::sources_list { tryphon:
    content => "deb http://debian.tryphon.org lenny main contrib
deb http://debian.tryphon.org lenny-backports main contrib
"
  }

  apt::key { "C6ADBBD5":
    source => "http://debian.tryphon.org/release.asc"
  }
}
