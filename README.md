# bashprofile [![Build Status](https://travis-ci.org/kemra102/puppet-bashprofile.svg?branch=master)](https://travis-ci.org/kemra102/puppet-bashprofile)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with bashprofile](#setup)
    * [What bashprofile affects](#what-bashprofile-affects)
    * [Beginning with bashprofile](#beginning-with-bashprofile)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module makes sure the BASH shell is installed and allows you to override any BASH environment variable you wish. Support for per user variables will be included in a future release.

## Module Description

As this module manages BASH environment variables it also installs BASH. The name of the package used to install BASH can be overriden if your platform differs from the default package name set by this module.

## Setup

### What bashprofile affects

* The BASH package (```bash``` on most platforms).
* System wide environment variables.

### Beginning with bashprofile

You can use this module to manage just a single environment variable like so:

```puppet
class { '::bashprofile':
  bash_variables => {
    'histtimeformat' => '%d.%m.%y %T ',
  }
}
```

## Usage

You can set as many environment variables as desired like so:

```puppet
class { '::bashprofile':
  bash_variables => {
    'histtimeformat' => '%d.%m.%y %T ',
    'histsize'       => '2000',
    'editor'         => '/usr/bin/emacs',
    'pager'          => 'more',
  }
}
```

Or in Hiera:

```yaml
---
classes:
  - bashprofile
bashprofile::bash_variables:
  histtimeformat: '%d.%m.%y %T '
  histsize: '2000'
  editor: '/usr/bin/emacs'
  pager: 'more'
```

### User specific environment variables

You can also configure user specific environment variables:

```puppet
bashprofile::user { 'jane.doe':
  environment_variables => {
    'editor' => '/usr/bin/vim',
  },
}
```

If the user also has a none standard home directoy (such as the root user) you can do that too:

```puppet
bashprofile::user { 'root':
  homedir               => '/root',
  environment_variables => {
    'editor' => '/usr/bin/vim',
  },
}
```

### Auto completion

This module also support inclusion of bash auto completion scripts.

These can be included on a node like so:

```puppet
class { '::bashprofile::autocomplete::systemdctl' }
```

or

```puppet
include '::bashprofile::autocomplete::systemdctl'
```

## Reference

### Classes

#### Public Classes

* `::bashprofile`: Installs BASH, adds requested environment variables under `/etc/profile.d/`.
* `::bashprofile::autocomplete::bash_completion`: Install the `bash-completion` package. On EL systems this requires the EPEL repo.
* `::bashprofile::autocomplete::git`: Provides auto-complettion feature for the Git DVCS.
* `::bashprofile::autocomplete::mercurial`: Provides auto-complettion feature for the Mercurial DVCS.
* `::bashprofile::autocomplete::svn`: Provides auto-complettion feature for the Subversion/SVN VCS.
* `::bashprofile::autocomplete::systemd`: Parent class that provides auto-completion features for systemd components. These components can be included individually instead if desired:
 * `::bashprofile::autocomplete::bootctl`: Provides auto-complettion feature for the bootctl systemd utility.
 * `::bashprofile::autocomplete::busctl`: Provides auto-complettion feature for the busctl systemd utility.
 * `::bashprofile::autocomplete::coredumpctl`: Provides auto-complettion feature for the coredumpctl systemd utility.
 * `::bashprofile::autocomplete::hostnamectl`: Provides auto-complettion feature for the hostnamectl systemd utility.
 * `::bashprofile::autocomplete::journalctl`: Provides auto-complettion feature for the journalctl systemd utility.
 * `::bashprofile::autocomplete::kernel_install`: Provides auto-complettion feature for the kernel-install systemd utility.
 * `::bashprofile::autocomplete::localectl`: Provides auto-complettion feature for the localectl systemd utility.
 * `::bashprofile::autocomplete::loginctl`: Provides auto-complettion feature for the loginctl systemd utility.
 * `::bashprofile::autocomplete::machinectl`: Provides auto-complettion feature for the machinectl systemd utility.
 * `::bashprofile::autocomplete::systemctl`: Provides auto-complettion feature for the systemctl systemd utility.
 * `::bashprofile::autocomplete::systemd_analyze`: Provides auto-complettion feature for the systemd-analyze systemd utility.
 * `::bashprofile::autocomplete::systemd_cat`: Provides auto-complettion feature for the systemd-cat systemd utility.
 * `::bashprofile::autocomplete::systemd_cgls`: Provides auto-complettion feature for the systemd-cgls systemd utility.
 * `::bashprofile::autocomplete::systemd_cgtop`: Provides auto-complettion feature for the systemd-cgtop systemd utility.
 * `::bashprofile::autocomplete::systemd_delta`: Provides auto-complettion feature for the systemd-delta systemd utility.
 * `::bashprofile::autocomplete::systemd_detect-virt`: Provides auto-complettion feature for the systemd-detect-virt systemd utility.
 * `::bashprofile::autocomplete::systemd_nspawn`: Provides auto-complettion feature for the systemd-nspawn systemd utility.
 * `::bashprofile::autocomplete::systemd_run`: Provides auto-complettion feature for the systemd-run systemd utility.
 * `::bashprofile::autocomplete::timedatectl`: Provides auto-complettion feature for the timedatectl systemd utility.
 * `::bashprofile::autocomplete::udevadm`: Provides auto-complettion feature for the udevadm systemd utility.

### Global Parameters

#### `package_name`

Name of the BASH package that is to be installed.

Default: `bash`

#### `bash_variables`

A hash of the environment variables to be added under `/etc/profile.d/`.

Default: N/A

### Auto Completion Parameters

#### `epel_class`

The `::bashprofile::autocomplete::bash_completion` class on EL systems require the EPEL repo. This class allows you to set the name of that class depedning on the module you are using to provide EPEL.

Default: `::epel`

## Limitations

This has only been tested on RedHat family systems. In theory it should work out of the box on any system where the BASH shell package name is `bash` and the `/etc/profile.d/` directory exists.

## Development

Contributions are welcome in any form, pull requests, and issues should be filed via GitHub.

###Contributors

The list of contributors can be found at: [https://github.com/kemra102/puppet-bashprofile/graphs/contributors](https://github.com/kemra102/puppet-bashprofile/graphs/contributors)
