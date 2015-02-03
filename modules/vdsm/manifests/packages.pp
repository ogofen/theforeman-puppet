class vdsm::packages {
    vcsrepo { '/root/vdsm-tools':
        ensure   => present,
        provider => git,
        source   => "https://github.com/ogofen/vdsm-tools.git",
        require  => Package['git'],
        before   => File['/root/.zshrc'],
    }
    package { 'iscsi-initiator-utils':
        ensure => installed,
        allow_virtual => false,
    }
}
