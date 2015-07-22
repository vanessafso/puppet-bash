class bash::autocomplete::busctl {

  if $::systemd_available {
    file { '/etc/profile.d/bustctl.sh':
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/bash/bustctl.sh',
    }
  }

}
