name             'duo-unix'
maintainer       'Risk I/O'
maintainer_email 'jro@risk.io'
license          'Apache 2.0'
description      'Configures Duo 2-factor auth for unix'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'chef-vault'
depends 'build-essential'
depends 'openssh'
