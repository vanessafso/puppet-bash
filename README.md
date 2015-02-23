# bashprofile

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with bashprofile](#setup)
    * [What bashprofile affects](#what-bashprofile-affects)
    * [Setup requirements](#setup-requirements)
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

## Reference

### Classes

#### Public Classes

* `::bashprofile`: Installs BASH, adds requested environment variables under `/etc/profile.d/`.

### Global Parameters

#### `package_name`

Name of the BASH package that is to be installed.

Default: `bash`

#### `bash_variables`

A hash of the environemnt variables to be added under `/etc/profile.d/`.

Default: N/A

## Limitations

This has only been tested on RedHat family systems. In theory it should work out of the box on any system where the BASH shell package name is `bash` and the `/etc/profile.d/` directory exists.

## Development

Contributions are welcome in any form, pull requests, and issues should be filed via GitHub.

###Contributors

The list of contributors can be found at: [https://github.com/kemra102/puppet-bashprofile/graphs/contributors](https://github.com/kemra102/puppet-bashprofile/graphs/contributors)
