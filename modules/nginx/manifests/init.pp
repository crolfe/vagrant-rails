class nginx::pkg {
  exec { 'nginx-apt-get-update':
    command => '/usr/bin/apt-get update',
    refreshonly => true,
  }

  $packages = [ 'nginx', 'nginx-extras' ]

  package { $packages:
    ensure => installed,
  }
}

class nginx::conf {
  File {
    require => Class['nginx::pkg'],
    notify => Class['nginx::service'],
    owner => 'root',
    group => 'root',
    mode => 644
  }

  file { '/etc/nginx/nginx.conf':
    source => 'puppet:///modules/nginx/nginx.conf'
  }

  file { 'nginx/sites-available':
    path => '/etc/nginx/sites-available',
    ensure => directory,
    owner => root,
    group => root,
    purge => true,
    recurse => true,
    source => "puppet:///modules/nginx/sites-available",
  }


  file { 'var/www':
    path => '/var/www',
    ensure => directory,
    owner => root,
    group => root,
  }

  file { 'var/www/nginx-default':
    path => '/var/www/nginx-default',
    ensure => directory,
    require => File['var/www'],
    owner => root,
    group => root,
    purge => true,
  }
  
  file { 'usr/share/nginx/www':
        path => '/usr/share/nginx/www/test.php',
        ensure => file,
        owner => root,
        group => root,
        source => 'puppet:///modules/nginx/test.php',
    }

}

class nginx::service {
  service { 'nginx':
    ensure => running,
    enable => true,
    require => Class['nginx::conf'],
  }
}

class nginx {
  include nginx::pkg, nginx::conf, nginx::service
}
