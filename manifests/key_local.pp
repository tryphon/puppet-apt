define apt::key_local($key = $name, $ensure = present, $source) {
  case $ensure {
    present: {
      file { "/etc/apt/$name.key":
        source => $source
      }

      exec { "/usr/bin/apt-key add /etc/apt/$name.key":
        unless => "apt-key list | grep -Fqe '${key}'",
        path   => "/bin:/usr/bin",
        before => Exec["apt_get_update"],
        notify => Exec["apt_get_update"],
        require => File["/etc/apt/$name.key"]
      }
    }
    
    absent: {
      exec {"/usr/bin/apt-key del ${key}":
        onlyif => "apt-key list | grep -Fqe '${key}'",
      }
    }
  }
}
