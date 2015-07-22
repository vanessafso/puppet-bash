class bash::autocomplete::systemd_delta {

  if $::systemd_available {
    file { '/etc/profile.d/systemd-delta.sh':
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/bash/systemd-delta.sh',
    }
  }

}
