class apt::phusion {
  include apt::https
  apt::sources_list { 'phusion-debian':
    content => "deb https://oss-binaries.phusionpassenger.com/apt/passenger ${debian::release} main",
    require => [File['/etc/apt/apt.conf.d/02allow-unauthenticated'], Exec['561F9B9CAC40B2F7']]
  }
  exec { '561F9B9CAC40B2F7':
    command => 'apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7',
    require => Package['apt-transport-https']
  }
}
