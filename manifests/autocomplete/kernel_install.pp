class bash::autocomplete::kernel_install {

  if $::systemd_available {
    file { '/etc/profile.d/kernel-install.sh':
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/bash/kernel-install.sh',
    }
  }

}
