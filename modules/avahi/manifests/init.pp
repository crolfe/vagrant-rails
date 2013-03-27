class avahi {
    package { 'avahi-daemon':
        ensure => present,
    }
    file {'avahi-daemon.conf':
        ensure => file,
        path   => '/etc/avahi/avahi-daemon.conf',
        owner  => root,
        group  => root,
        source => 'puppet:///modules/avahi/avahi-daemon.conf',
    }
}



