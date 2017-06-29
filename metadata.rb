name 'optoro_ruby'
maintainer 'Optoro'
maintainer_email 'devops@optoro.com'
license 'MIT'
description 'This cookbook installs ruby'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
source_url 'https://github.com/optoro-devops/optoro_ruby'
issues_url 'https://github.com/optoro-devops/optoro_ruby/issues'
version '1.1.2'

depends 'apt'
depends 'build-essential'
depends 'optoro_aptly', '~> 0.2.2'
depends 'rvm'
