class haml {
    $packages = [ 'ruby-haml', 'libhaml-ruby' ]
    package { $packages:
        ensure => installed,
    }
}
