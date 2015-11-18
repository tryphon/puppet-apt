class apt::https {
  package { 'apt-transport-https': require => Package['ca-certificates'] }
  package { 'ca-certificates': }
}
