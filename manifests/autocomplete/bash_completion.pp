class bashprofile::autocomplete::bash_completion (
  $epel_class = '::epel',

) {

  if $::osfamily == 'RedHat' {
    require $epel_class
  }

  package { 'bash-completion':
    ensure => 'installed',
  }

}
