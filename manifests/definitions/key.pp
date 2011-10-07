define apt::key($ensure = present, $source) {
  case $ensure {
    present: {
      if $source =~ /^http:/ {
        if ! defined(Package[wget]) {
          package { wget: }
        }
        exec { "/usr/bin/wget -O - '$source' | /usr/bin/apt-key add -":
          unless => "apt-key list | grep -Fqe '${name}'",
          path   => "/bin:/usr/bin",
          before => Exec["apt-get_update"],
          notify => Exec["apt-get_update"],
          require => Package[wget]
        }
      } else {
        file { "/etc/apt/keys": 
          ensure => directory 
        }
        file { "/etc/apt/keys/$name": 
          source => $source
        }
        exec { "/usr/bin/apt-key add /etc/apt/keys/$name":
          unless => "apt-key list | grep -Fqe '${name}'",
          path   => "/bin:/usr/bin",
          require => File["/etc/apt/keys/$name"],
          before => Exec["apt-get_update"],
          notify => Exec["apt-get_update"],
        }
      }
    }
    
    absent: {
      exec {"/usr/bin/apt-key del ${name}":
        onlyif => "apt-key list | grep -Fqe '${name}'",
      }
    }
  }
}
