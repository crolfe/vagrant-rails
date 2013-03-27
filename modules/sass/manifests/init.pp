class sass {
    package { 'sass': 
        ensure   => latest,
        provider => gem,
    }
}
