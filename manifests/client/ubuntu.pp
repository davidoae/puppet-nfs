class nfs::client::ubuntu inherits nfs::base {

  package { ["nfs-common", "rpcbind"]:
    ensure => present,
  }

  service { "portmap":
    ensure    => running,
    enable    => true,
    hasstatus => false,
    status    => "service postmap status | grep -q 'start/running'",
    require   => Package["rpcbind"],
  }

}
