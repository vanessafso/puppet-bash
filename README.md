# bash [![Build Status](https://travis-ci.org/kemra102/puppet-bash.svg?branch=master)](https://travis-ci.org/kemra102/puppet-bash)

### Module Source: https://github.com/kemra102/puppet-bash

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with bash](#setup)
    * [What bash affects](#what-bash-affects)
4. [Usage - Configuration options and additional functionality](#usage)
    * [Setting environment variables](#setting-environment-vriables)
    * [User specific environment variables](#user-specific-environment-vriables)
    * [Auto completion](#auto-completion)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
    * [Classes](#classes)
        * [Public classes](#public-classes)
    * [Global parameters](#global-parameters)
    * [Auto completion parameters](#auto-completion parameters)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module makes sure the BASH shell is installed and manages BASH shell variables and other functionality around the BASH shell.

## Module Description

As this module manages BASH environment variables it also installs BASH. The name of the package used to install BASH can be overriden if your platform differs from the default package name set by this module.

## Setup

### What bash affects

* The BASH package (```bash``` on most platforms).
* System wide environment variables.
* User specific environment variables.
* Auto completion.

## Usage

### Setting environment variables

You can use this module to manage just a single environment variable like so:

```puppet
class { '::bash':
  env_variables => {
    'histtimeformat' => '%d.%m.%y %T ',
  }
}
```

You can set as many environment variables as desired like so:

```puppet
class { '::bash':
  env_variables => {
    'histtimeformat' => '%d.%m.%y %T ',
    'histsize'       => '2000',
    'editor'         => '/usr/bin/emacs',
    'pager'          => 'more',
  }
}
```

### User specific environment variables

You can also configure user specific environment variables:

```puppet
bash::user { 'jane.doe':
  env_variables => {
    'editor' => '/usr/bin/vim',
  },
}
```

If the user also has a none standard home directoy (such as the root user) you can do that too:

```puppet
bash::user { 'root':
  homedir       => '/root',
  env_variables => {
    'editor' => '/usr/bin/vim',
  },
}
```

### Auto completion

This module also support inclusion of bash auto completion scripts.

These can be included on a node like so:

```puppet
class { '::bash::autocomplete::systemdctl' }
```

or

```puppet
include '::bash::autocomplete::systemdctl'
```

## Reference

### Classes

#### Public classes

* `::bash`: Installs BASH, adds requested environment variables under `/etc/profile.d/`.
* `::bash::autocomplete::bash_completion`: Install the `bash-completion` package. On EL systems this requires the EPEL repo.
* `::bash::autocomplete::git`: Provides auto-complettion feature for the Git DVCS.
* `::bash::autocomplete::mercurial`: Provides auto-complettion feature for the Mercurial DVCS.
* `::bash::autocomplete::svn`: Provides auto-complettion feature for the Subversion/SVN VCS.
* `::bash::autocomplete::systemd`: Parent class that provides auto-completion features for systemd components. These components can be included individually instead if desired:
 * `::bash::autocomplete::bootctl`: Provides auto-complettion feature for the bootctl systemd utility.
 * `::bash::autocomplete::busctl`: Provides auto-complettion feature for the busctl systemd utility.
 * `::bash::autocomplete::coredumpctl`: Provides auto-complettion feature for the coredumpctl systemd utility.
 * `::bash::autocomplete::hostnamectl`: Provides auto-complettion feature for the hostnamectl systemd utility.
 * `::bash::autocomplete::journalctl`: Provides auto-complettion feature for the journalctl systemd utility.
 * `::bash::autocomplete::kernel_install`: Provides auto-complettion feature for the kernel-install systemd utility.
 * `::bash::autocomplete::localectl`: Provides auto-complettion feature for the localectl systemd utility.
 * `::bash::autocomplete::loginctl`: Provides auto-complettion feature for the loginctl systemd utility.
 * `::bash::autocomplete::machinectl`: Provides auto-complettion feature for the machinectl systemd utility.
 * `::bash::autocomplete::systemctl`: Provides auto-complettion feature for the systemctl systemd utility.
 * `::bash::autocomplete::systemd_analyze`: Provides auto-complettion feature for the systemd-analyze systemd utility.
 * `::bash::autocomplete::systemd_cat`: Provides auto-complettion feature for the systemd-cat systemd utility.
 * `::bash::autocomplete::systemd_cgls`: Provides auto-complettion feature for the systemd-cgls systemd utility.
 * `::bash::autocomplete::systemd_cgtop`: Provides auto-complettion feature for the systemd-cgtop systemd utility.
 * `::bash::autocomplete::systemd_delta`: Provides auto-complettion feature for the systemd-delta systemd utility.
 * `::bash::autocomplete::systemd_detect-virt`: Provides auto-complettion feature for the systemd-detect-virt systemd utility.
 * `::bash::autocomplete::systemd_nspawn`: Provides auto-complettion feature for the systemd-nspawn systemd utility.
 * `::bash::autocomplete::systemd_run`: Provides auto-complettion feature for the systemd-run systemd utility.
 * `::bash::autocomplete::timedatectl`: Provides auto-complettion feature for the timedatectl systemd utility.
 * `::bash::autocomplete::udevadm`: Provides auto-complettion feature for the udevadm systemd utility.

### Global parameters

#### `package_name`

Name of the BASH package that is to be installed.

Default: `bash`

#### `env_variables`

A hash of the environment variables to be added under `/etc/profile.d/`.

Default: N/A

### Auto completion parameters

#### `epel_class`

The `::bash::autocomplete::bash_completion` class on EL systems require the EPEL repo. This class allows you to set the name of that class depedning on the module you are using to provide EPEL.

Default: `::epel`

## Limitations

This has only been tested on RedHat family systems. In theory it should work out of the box on any system where the BASH shell package name is `bash` and the `/etc/profile.d/` directory exists.

## Development

Contributions are welcome in any form, pull requests, and issues should be filed via GitHub.

###Contributors

The list of contributors can be found at: [https://github.com/kemra102/puppet-bash/graphs/contributors](https://github.com/kemra102/puppet-bash/graphs/contributors)
