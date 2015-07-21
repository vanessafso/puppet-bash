class bashprofile::autocomplete::localectl {

  if $::systemd_available {
    file { '/etc/profile.d/localectl.sh':
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/bashprofile/localectl.sh',
    }
  }

}
