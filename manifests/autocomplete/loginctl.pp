class bash::autocomplete::loginctl {

  if $::systemd_available {
    file { '/etc/profile.d/loginctl.sh':
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/bash/loginctl.sh',
    }
  }

}
