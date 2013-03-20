stage { 'first':
    before => Stage['main']
}

class { 'apt_get::update':
    stage => first,
}

include apt_get::update
include avahi-daemon
include git
include nodejs
include postgres
include ruby
include vim

