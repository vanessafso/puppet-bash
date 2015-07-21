class bashprofile::autocomplete::systemd {

  if $::systemd_available {
    include '::bashprofile::autocomplete::bootctl'
    include '::bashprofile::autocomplete::busctl'
    include '::bashprofile::autocomplete::coredumpctl'
    include '::bashprofile::autocomplete::hostnamectl'
    include '::bashprofile::autocomplete::journalctl'
    include '::bashprofile::autocomplete::kernel_install'
    include '::bashprofile::autocomplete::localectl'
    include '::bashprofile::autocomplete::loginctl'
    include '::bashprofile::autocomplete::machinectl'
    include '::bashprofile::autocomplete::systemctl'
    include '::bashprofile::autocomplete::systemd_analyze'
    include '::bashprofile::autocomplete::systemd_cat'
    include '::bashprofile::autocomplete::systemd_cgls'
    include '::bashprofile::autocomplete::systemd_cgtop'
    include '::bashprofile::autocomplete::systemd_delta'
    include '::bashprofile::autocomplete::systemd_detect_virt'
    include '::bashprofile::autocomplete::systemd_nspawn'
    include '::bashprofile::autocomplete::systemd_run'
    include '::bashprofile::autocomplete::timedatectl'
    include '::bashprofile::autocomplete::udevadm'
  }

}
