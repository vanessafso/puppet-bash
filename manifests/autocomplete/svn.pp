class bash::autocomplete::svn {

  file { '/etc/profile.d/svn.sh':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/bash/svn.sh',
  }

}
