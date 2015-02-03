class vim::vim-toolbox {
	file { '/root/.vimrc':
		owner => root, group => root, mode => 644,
        ensure => present,
        source => 'puppet:///modules/vim/vimrc'
	}
    vcsrepo { '/root/.vim':
        ensure   => present,
        provider => git,
        source   => "https://github.com/ogofen/vim.git",
    }
}
