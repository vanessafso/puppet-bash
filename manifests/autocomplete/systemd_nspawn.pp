class bash::autocomplete::systemd_nspawn {

  if $::systemd_available {
    file { '/etc/profile.d/systemd-nspawn.sh':
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/bash/systemd-nspawn.sh',
    }
  }

}
