class engine::repos {
    vcsrepo { '/root/engine-repos':
        ensure   => present,
        provider => git,
        source   => "https://github.com/ogofen/engine-$operatingsystemrelease-repos.git",
        before   => File['/etc/yum.repos.d/epel.repo','/etc/yum.repos.d/cobbler-config.repo'],
    }
    vcsrepo { '/root/Py_Sdk_Qe':
        ensure   => present,
        provider => git,
        source   => "https://github.com/ogofen/Py_Sdk_Qe.git",
    }
   	file { '/etc/yum.repos.d/epel.repo':
		owner => root, group => root, mode => 644,
        ensure => present,
        source => '/root/engine-repos/epel.repo',
	} 
   	file { '/etc/yum.repos.d/cobbler-config.repo':
		owner => root, group => root, mode => 644,
        ensure => present,
        source => '/root/engine-repos/cobbler-config.repo',
	} 
   	file { '/etc/yum.repos.d/rhel-source.repo':
		owner => root, group => root, mode => 644,
        ensure => present,
        source => '/root/engine-repos/rhel-source.repo',
	} 
    case $operatingsystemrelease {
        6.5: { 
               file { '/etc/yum.repos.d/rhel-65-all.repo':
                   owner => root, group => root, mode => 644,
                   ensure => present,
                   source => '/root/engine-repos/rhel-65-all.repo',
                }
           }
        6.6: {
                file { '/etc/yum.repos.d/rhel-66-all.repo':
                    owner => root, group => root, mode => 644,
                    ensure => present,
                    source => '/root/engine-repos/rhel-66-all.repo',
                }
            }
    }
}
