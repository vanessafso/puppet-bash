class bashprofile::autocomplete::hostnamectl {

  if $::systemd_available {
    file { '/etc/profile.d/hostnamectl.sh':
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/bashprofile/hostnamectl.sh',
    }
  }

}
