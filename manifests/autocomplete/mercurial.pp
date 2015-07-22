class bash::autocomplete::mercurial {

  file { '/etc/profile.d/hg.sh':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/bash/hg.sh',
  }

}
