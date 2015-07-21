class bashprofile::autocomplete::systemctl {

  if $::systemd_available {
    file { '/etc/profile.d/systemctl.sh':
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/bashprofile/systemctl.sh',
    }
  }

}
