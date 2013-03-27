class cucumber {
    $packages = [ 'cucumber', 'ruby-gherkin' ]
    package { $packages:
        ensure => installed, 
   }
}
