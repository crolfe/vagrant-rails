class postgres::pkg {
  package { 'postgresql':
    ensure => installed
  }
}

class postgres::conf {
  File {
    require => Class['postgres::pkg'],
    notify  => Class['postgres::service'],
    owner   => 'postgres',
    group   => 'postgres',
    mode    => 644,
  }

  file { 'postgresql/9.1/main':
    path   => '/etc/postgresql/9.1/main',
    ensure => directory,
  }

  file { '/etc/postgresql/9.1/main/environment':
    source => 'puppet:///modules/postgres/9.1/main/environment'
  }

  file { '/etc/postgresql/9.1/main/pg_ctl.conf':
    source => 'puppet:///modules/postgres/9.1/main/pg_ctl.conf'
  }

  file { '/etc/postgresql/9.1/main/pg_hba.conf':
    source => 'puppet:///modules/postgres/9.1/main/pg_hba.conf',
    mode   => '640'
  }

  file { '/etc/postgresql/9.1/main/pg_ident.conf':
    source => 'puppet:///modules/postgres/9.1/main/pg_ident.conf',
    mode   => '640'
  }

  file { '/etc/postgresql/9.1/main/postgresql.conf':
    source => 'puppet:///modules/postgres/9.1/main/postgresql.conf'
  }

  file { '/etc/postgresql/9.1/main/start.conf':
    source => 'puppet:///modules/postgres/9.1/main/start.conf'
  }
}

class postgres::service {
  service { 'postgresql':
    ensure     => running,
    enable     => true,
    require    => Class['postgres::conf'],
    hasrestart => true,
    hasstatus  => false,
  }
}

class postgres {
  include postgres::pkg, postgres::conf, postgres::service
}
