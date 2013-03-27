class rails {
    package { 'rails':
        ensure   => latest,
        provider => gem,
    }
}
