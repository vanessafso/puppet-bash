class bash::autocomplete::systemd {

  if $::systemd_available {
    include '::bash::autocomplete::bootctl'
    include '::bash::autocomplete::busctl'
    include '::bash::autocomplete::coredumpctl'
    include '::bash::autocomplete::hostnamectl'
    include '::bash::autocomplete::journalctl'
    include '::bash::autocomplete::kernel_install'
    include '::bash::autocomplete::localectl'
    include '::bash::autocomplete::loginctl'
    include '::bash::autocomplete::machinectl'
    include '::bash::autocomplete::systemctl'
    include '::bash::autocomplete::systemd_analyze'
    include '::bash::autocomplete::systemd_cat'
    include '::bash::autocomplete::systemd_cgls'
    include '::bash::autocomplete::systemd_cgtop'
    include '::bash::autocomplete::systemd_delta'
    include '::bash::autocomplete::systemd_detect_virt'
    include '::bash::autocomplete::systemd_nspawn'
    include '::bash::autocomplete::systemd_run'
    include '::bash::autocomplete::timedatectl'
    include '::bash::autocomplete::udevadm'
  }

}
