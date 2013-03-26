class nodejs {
    $packages = [ 'nodejs', 'nodejs-dev', 'npm' ]
    package { $packages:
        ensure => latest,
    }
}
