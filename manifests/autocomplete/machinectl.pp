class bashprofile::autocomplete::machinectl {

  if $::systemd_available {
    file { '/etc/profile.d/machinectl.sh':
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/bashprofile/machinectl.sh',
    }
  }

}
