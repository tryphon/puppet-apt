define apt::preferences($ensure="present", $package, $pin, $priority) {

  concatenated_file_part { $name:
    ensure  => $ensure,
    dir    => "/etc/apt/preferences.d",
    content => template("apt/preferences.erb"),
  }

}
