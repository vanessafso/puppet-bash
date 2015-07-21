class bashprofile::autocomplete::coredumpctl {

  if $::systemd_available {
    file { '/etc/profile.d/coredumpctl.sh':
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/bashprofile/coredumpctl.sh',
    }
  }

}
