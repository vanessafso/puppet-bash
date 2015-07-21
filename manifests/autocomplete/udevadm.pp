class bashprofile::autocomplete::udevadm {

  if $::systemd_available {
    file { '/etc/profile.d/udevadm.sh':
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/bashprofile/udevadm.sh',
    }
  }

}
