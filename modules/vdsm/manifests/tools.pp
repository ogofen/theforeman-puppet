class vdsm::tools {
    require vdsm::packages
	file { '/root/.zshrc':
		owner => root, group => root, mode => 644,
        ensure => present,
        source => '/root/vdsm-tools/.zshrc',
	}
	file { '/root/.bashrc':
		owner => root, group => root, mode => 644,
        ensure => present,
        source => '/root/vdsm-tools/.bashrc',

	}
	file { '/root/vdsm.vim':
		owner => root, group => root, mode => 644,
        ensure => present,
        source => '/root/vdsm-tools/vdsm.vim',

    }
	file { '/root/.monitor':
		owner => root, group => root, mode => 647,
        ensure => present,
        source => '/root/vdsm-tools/.monitor',
    }
    file { '/root/isCleanUpNeeded.sh':
		owner => root, group => root, mode => 755,
        ensure => present,
        source => 'puppet:///modules/server-action/isCleanUpNeeded.sh',
	}
    file { '/usr/bin/getAllVolumesInfo':
		owner => root, group => root, mode => 755,
        ensure => present,
        source => 'puppet:///modules/vdsm/getAllVolumesInfo',
	}
}

