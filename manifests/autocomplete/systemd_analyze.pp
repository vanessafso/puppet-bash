class bash::autocomplete::systemd_analyze {

  if $::systemd_available {
    file { '/etc/profile.d/systemd-analyze.sh':
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/bash/systemd-analyze.sh',
    }
  }

}
