class bash::autocomplete::journalctl {

  if $::systemd_available {
    file { '/etc/profile.d/journalctl.sh':
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/bash/journalctl.sh',
    }
  }

}
