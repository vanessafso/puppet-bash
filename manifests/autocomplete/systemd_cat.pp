class bashprofile::autocomplete::systemd_cat {

  if $::systemd_available {
    file { '/etc/profile.d/systemd-cat.sh':
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/bashprofile/systemd-cat.sh',
    }
  }

}
