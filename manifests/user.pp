define bash::user (
  $homedir               = "/home/${name}",
  $env_variables = {},
) {

  validate_string($name)
  validate_absolute_path($homedir)
  validate_hash($env_variables)

  file { "${homedir}/.bash_profile":
    ensure  => 'file',
    owner   => $name,
    mode    => '0644',
    content => template('bash/user-profile.erb'),
  }

}
