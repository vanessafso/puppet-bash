define bashprofile::user (
  $user                  = $name,
  $homedir               = "/home/$name",
  $environment_variables = {},
) {

  validate_string($user)
  validate_absolute_path($homedir)
  validate_hash($environment_variables)

  file { "${homedir}/.bash_profile":
    ensure  => 'file',
    owner   => $user,
    mode    => '0644',
    content => template('bashprofile/user-profile.erb'),
  }

}
