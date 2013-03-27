class rspec {
    $packages = ['ruby-rspec', 'ruby-rspec-core', 'ruby-rspec-expectations', 'ruby-rspec-mocks', 'librspec-ruby1.9.1' ]
    package { $packages:
        ensure => installed,
    }
}
