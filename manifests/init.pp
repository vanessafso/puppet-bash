# == Class: bash
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
# [*env_variables*]
#   A hash of the BASH environment variables you wish to set.
#
# === Examples
#
#  class { 'bash':
#    env_variables => {
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
class bash (

  $package_name  = 'bash',
  $env_variables = {},

) {

  validate_hash($env_variables)

  package { $package_name:
    ensure => 'present',
  }

  file { '/etc/profile.d/puppet_managed.sh':
    ensure  => 'file',
    content => template('bash/etc-profile.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

}
