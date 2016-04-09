# == Class: cygwin_apt_cyg
#
# Setup atp-cyg, apt-get like package manager for CygWin
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'cygwin_apt_cyg':  }
#
# === Authors
#
# st01tkh <st01tkh@gmail.com>
#
# === Copyright
#
# Copyright 2016 st01tkh
#
class cygwin_apt_cyg {
  if ($operatingsystem == 'windows') {
      $cygwinroot = get_cygwin_root()
      if ($cygwinroot) {
          $sysroot = env("SYSTEMROOT")
          $sys32 = file_join_win(["${sysroot}", "System32"])
          $cygwin_vendor = file_join_win(["${cygwinroot}", "vendor"])
          $cygwin_aptcyg = file_join_win(["${cygwin_vendor}", "apt-cyg"])
          $cygwin_bin = file_join_win(["${cygwinroot}", "bin"])
          file {"${cygwin_aptcyg}": ensure => 'directory' } ->
          download_file {"download apt-cyg" :
              url => 'https://raw.githubusercontent.com/transcode-open/apt-cyg/master/apt-cyg',
              destination_directory => "${cygwin_vendor}\\apt-cyg",
          } ->
          exec {'create_apt-cyg_symlink':
            path => ["$sysroot", "$sys32", "${cygwin_bin}", ],
            cwd => "${cygwin_bin}",
            command => 'bash.exe -c "[ -L /usr/local/bin/apt-get ] && ln -sf /usr/local/bin/apt-get && rm /usr/local/bin/apt-get; ln -s /vendor/apt-cyg/apt-cyg /usr/local/bin/apt-cyg; exit 0"',
          }
      } else {
          notify {"cygwin root does not exist": }
      }
  } else {
      notify {"$operatingsystem is not supported": }
  }
}
