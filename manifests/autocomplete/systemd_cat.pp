class bash::autocomplete::systemd_cat {

  if $::systemd_available {
    file { '/etc/profile.d/systemd-cat.sh':
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/bash/systemd-cat.sh',
    }
  }

}
