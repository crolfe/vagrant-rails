class tools {
    $packages = [
        'python-software-properties', 'curl', 'build-essential', 'libssl-dev',
    ]
    package { $packages:
        ensure => installed,
    }
}
