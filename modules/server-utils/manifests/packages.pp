class server-utils::packages {
    require server-utils::repos
    package { 'ctags':
        ensure => installed,
        allow_virtual => false,
    }
    package { 'git':
        ensure => installed,
        allow_virtual => false,
    }
    package { 'zsh':
        ensure => installed,
        allow_virtual => false,
    }
    package { 'xorg-x11-xauth':
        ensure => installed,
        allow_virtual => false,
    }
    package { 'ack':
        ensure => installed,
        allow_virtual => false,
    }
    package { 'bpython':
        ensure => installed,
        allow_virtual => false,
    }
    package { 'vim-X11':
        ensure => installed,
        allow_virtual => false,
    }
    package { 'ncurses':
        ensure => installed,
        allow_virtual => false,
    }

    package { 'htop':
        ensure => installed,
        allow_virtual => false,
    }
}
