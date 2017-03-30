class apt::d7031 {
  apt::sources_list { 'd7031':
    content => "deb http://www.d7031.de/debian wheezy-experimental main",
    require => Apt::Key_Local['d7031']
  }
  apt::key_local { 'd7031':
    key    => "DF17D0B3",
    source => "puppet:///modules/apt/d7031.key"
  }
}
