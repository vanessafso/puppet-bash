class bashprofile::autocomplete::kernel_install {

  if $::systemd_available {
    file { '/etc/profile.d/kernel-install.sh':
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/bashprofile/kernel-install.sh',
    }
  }

}
