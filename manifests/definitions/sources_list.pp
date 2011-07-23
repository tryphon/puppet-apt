define apt::sources_list (
  $ensure = present,
  $source = false,
  $content = false) {
    
  if $source {
    file {"/etc/apt/sources.list.d/${name}.list":
      ensure => $ensure,
      source => $source,
      notify => Exec["apt-get-update-for-source-${name}"]
    }
  } else {
    file {"/etc/apt/sources.list.d/${name}.list":
      ensure  => $ensure,
      content => $content,
      notify => Exec["apt-get-update-for-source-${name}"]
    }
  }
  exec { "apt-get-update-for-source-${name}":
    command => "apt-get update",
    refreshonly => true
  }
}
