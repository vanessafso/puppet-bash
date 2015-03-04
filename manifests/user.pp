define bashprofile::user (
  $homedir               = "/home/$name",
  $environment_variables = {},
) {

  validate_string($name)
  validate_absolute_path($homedir)
  validate_hash($environment_variables)

  file { "${homedir}/.bash_profile":
    ensure  => 'file',
    owner   => $name,
    mode    => '0644',
    content => template('bashprofile/user-profile.erb'),
  }

}
