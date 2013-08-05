class nfs::client {
  case $operatingsystem {
    Ubuntu:         { $nfsclient = 'ubuntu' }
    Debian:         { $nfsclient = 'debian' }
    RedHat,CentOS:  { $nfsclient = 'redhat' }
    default: {
      $nfsclient = false
      notice "Unsupported operatingsystem ${operatingsystem}"
    }
  }

  if ($nfsclient) {
    include "nfs::client::${nfsclient}"
    Class["nfs::client::${nfsclient}"] -> Mount <| |>
  }
}
