define apt::preferences($ensure="present", $package, $pin, $priority) {
  if ($lsbdistcodename != 'squeeze') {
    concatenated_file_part { $name:
      ensure  => $ensure,
      dir    => "/etc/apt/preferences.d",
      content => template("apt/preferences.erb"),
    } 
  } else {
    file { "/etc/apt/preferences.d/$name": 
      content => template("apt/preferences.erb")
    }
  }
}
