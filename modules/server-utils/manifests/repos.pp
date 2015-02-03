class server-utils::repos {
    include server-action::latest
   	file { '/etc/yum.repos.d/epel.repo':
		owner => root, group => root, mode => 644,
        ensure => present,
        source => "puppet:///modules/server-utils/rhel-$operatingsystemrelease-repos/epel.repo",
	} 
   	file { '/etc/yum.repos.d/rhel-optional.repo':
		owner => root, group => root, mode => 644,
        ensure => present,
        source => "puppet:///modules/server-utils/rhel-$operatingsystemrelease-repos/rhel-optional.repo",
	} 
   	file { '/etc/yum.repos.d/rhel-server.repo':
		owner => root, group => root, mode => 644,
        ensure => present,
        source => "puppet:///modules/server-utils/rhel-$operatingsystemrelease-repos/rhel-server.repo",
	} 
   	file { '/etc/yum.repos.d/rhel-source.repo':
		owner => root, group => root, mode => 644,
        ensure => present,
        source => "puppet:///modules/server-utils/rhel-$operatingsystemrelease-repos/rhel-source.repo",
	}
   	file { "/etc/yum.repos.d/rhel$operatingsystemmajrelease":
		owner => root, group => root, mode => 644,
        ensure => present,
        source => "puppet:///modules/server-utils/rhel-$operatingsystemrelease-repos/rhel$operatingsystemmajrelease.repo",
	}
}
