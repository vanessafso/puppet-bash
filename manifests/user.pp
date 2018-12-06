define bash::user (
  $homedir       = "/home/${name}",
  $env_variables = {},
  $user_group    = undef,
) {

  validate_string($name)
  validate_absolute_path($homedir)
  validate_hash($env_variables)

  if $user_group == undef {
    file { "${homedir}/.bash_profile":
      ensure  => 'file',
      owner   => $name,
      group   => $name,
      mode    => '0644',
      content => template('bash/user-profile.erb'),
    }

  } else {
    file { "${homedir}/.bash_profile":
      ensure  => 'file',
      owner   => $name,
      group   => $user_group,
      mode    => '0644',
      content => template('bash/user-profile.erb'),
    }
  }

}
