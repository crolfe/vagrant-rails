stage { 'first':
    before => Stage['second']
}

stage { 'second':
    before => Stage['third']
}

stage { 'third':
    before => Stage['main']
}

class { 'apt_get::update':
    stage => first,
}

class { 'ruby':
    stage => second,
}

class { 'rails':
    stage => third,
}

include apt_get::update
include avahi
include cucumber
include git
include haml
include nginx
include nodejs
include postgres
include rails
include rspec
include ruby
include sass
include vim

