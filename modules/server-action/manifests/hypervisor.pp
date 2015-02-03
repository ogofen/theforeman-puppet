class server-action::hypervisor::install {
    package { 'glusterfs':
        ensure => installed,
        allow_virtual => false,
    }
    package { 'glusterfs-libs':
        ensure => installed,
        allow_virtual => false,
    }
    package { 'glusterfs-fuse':
        ensure => installed,
        allow_virtual => false,
    }
    package { 'glusterfs-rdma':
        ensure => installed,
        allow_virtual => false,
    }
    package { 'glusterfs-devel':
        ensure => installed,
        allow_virtual => false,
    }
    package { 'glusterfs-debuginfo':
        ensure => installed,
        allow_virtual => false,
    }
    package { 'glusterfs-api-devel':
        ensure => installed,
        allow_virtual => false,
    }
}
class server-action::hypervisor::clean {
    Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
    exec { 'clean': 
        command => "yum remove vdsm* -y;yum remove *qemu* -y;yum remove *libvirt* -y;yum remove vdsm-cli vdsm-jsonrpc vdsm-python vdsm-python-zombiereaper vdsm-xmlrpc vdsm-yajsonrpc -y;rm -rf /root/vdsm*",
        onlyif => "/root/isCleanUpNeeded.sh",
        before => File['/root/cleanflag'],
    }
    file { '/root/cleanflag':
		owner => root, group => root, mode => 755,
        ensure => absent,
	}
}
