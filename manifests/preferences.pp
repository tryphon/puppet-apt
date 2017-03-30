define apt::preferences($ensure='present', $package, $pin, $priority, $content = false) {
  $real_content = $content ? {
    false => template('apt/preferences.erb'),
    default => $content
  }

  if $debian::lenny {
    concatenated_file_part { $name:
      ensure  => $ensure,
      dir    => '/etc/apt/preferences.d',
      content => $real_content,
    }
  } else {
    file { "/etc/apt/preferences.d/$name":
      content => $real_content
    }
  }
}
