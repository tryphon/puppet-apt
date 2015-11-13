class apt::bearstech {
  apt::sources_list { 'bearstech':
    content => "deb http://deb.bearstech.com/debian ${debian::release}-bearstech main",
    require => Apt::Key_local['bearstech']
  }
  apt::key_local { 'bearstech':
    key => '90158EE0',
    source => 'puppet:///apt/bearstech.key'
  }
}
