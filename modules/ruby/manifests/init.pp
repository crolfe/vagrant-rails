class ruby {
    package { 'ruby1.9.3':
        ensure => installed,
    }
    package { 'ruby-rvm':
        ensure => installed,
    }
}
