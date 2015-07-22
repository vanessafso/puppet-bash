class bash::autocomplete::systemd_run {

  if $::systemd_available {
    file { '/etc/profile.d/systemd-run.sh':
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/bash/systemd-run.sh',
    }
  }

}
