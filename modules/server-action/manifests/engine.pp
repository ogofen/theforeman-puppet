class server-action::engine::setup {
    package { 'rhevm':
        ensure => installed,
        allow_virtual => false,
    }
    file { '/root/config.setup':
		owner => root, group => root, mode => 644,
        ensure => present,
        content => template('server-action/config.erb'),
	}
    file { '/root/isSetupNeeded.sh':
		owner => root, group => root, mode => 755,
        ensure => present,
        source => 'puppet:///modules/server-action/isSetupNeeded.sh',
        before => Package['rhevm'],
	}
    Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
    exec { 'setup': 
        command => "yum update rhevm -y;engine-setup --config=/root/config.setup",
        onlyif => "/root/isSetupNeeded.sh",
        before => File['/root/setupflag'],
    }
    file { '/root/setupflag':
		owner => root, group => root, mode => 755,
        ensure => absent,
	}
    file { '/root/Py_Sdk_Qe/sdk_connect.py':
		owner => root, group => root, mode => 755,
        ensure => present,
        content => template('engine/sdk_connect.erb'),
	}


}
