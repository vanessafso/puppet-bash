# == Class: bashprofile
#
# This class makes sure the BASH shell is installed and allows you to
# override any BASH environment variable you wish.
#
# === Parameters
#
# Document parameters here.
#
# [*package_name*]
#   Package name of the BASH shell on your platform.
#
# [*bash_variables*]
#   A hash of the BASH environment variables you wish to set.
#
# === Examples
#
#  class { 'bashprofile':
#    bash_variables => {
#      'item' => 'value',
#    }    
#  }
#
# === Authors
#
# Danny Roberts <danny@thefallenphoenix.net>
#
# === Copyright
#
# Copyright 2015 Danny Roberts
#
class bashprofile {

  $package_name   = 'bash'
  $bash_variables = {}

  validate_hash($bash_variables)

  package { $package_name:
    ensure => 'present',
  }

  file { '/etc/profile.d/puppet_managed.sh':
    ensure  => 'file',
    content => template('bashprofile/etc-profile.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

}
