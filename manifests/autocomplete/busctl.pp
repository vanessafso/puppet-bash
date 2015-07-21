class bashprofile::autocomplete::busctl {

  if $::systemd_available {
    file { '/etc/profile.d/bustctl.sh':
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/bashprofile/bustctl.sh',
    }
  }

}
