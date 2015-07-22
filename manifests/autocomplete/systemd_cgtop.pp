class bash::autocomplete::systemd_cgtop {

  if $::systemd_available {
    file { '/etc/profile.d/systemd-cgtop.sh':
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/bash/systemd-cgtop.sh',
    }
  }

}
