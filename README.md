# Description

This cookbook installs ruby

# Requirements

## Platform:

* Ubuntu (= 14.04)

## Cookbooks:

* apt
* build-essential
* rvm

# Attributes

* `node['optoro_ruby']['install_method']` -  Defaults to `build_source`.
* `node['optoro_ruby']['ruby_major_version']` -  Defaults to `2.1`.
* `node['optoro_ruby']['ruby_minor_version']` -  Defaults to `2`.
* `node['optoro_ruby']['ruby_full_version']` -  Defaults to `%{major}.%{minor}`.
* `node['optoro_ruby']['source_name']` -  Defaults to `format('ruby-%{full_version}.tar.gz', full_version: node['optoro_ruby']['ruby_full_version'])`.
* `node['optoro_ruby']['source_directory']` -  Defaults to `format('/tmp/ruby-%{full_version}', full_version: node['optoro_ruby']['ruby_full_version'])`.
* `node['optoro_ruby']['download_url']` -  Defaults to `download_url`.
* `node['optoro_ruby']['source_sha256_sum']` -  Defaults to `f22a6447811a81f3c808d1c2a5ce3b5f5f0955c68c9a749182feb425589e6635`.
* `node['optoro_ruby']['source_dependencies']` -  Defaults to `%w(`.
* `node['optoro_ruby']['debian_build_dependencies']` -  Defaults to `%w(`.
* `node['optoro_ruby']['maintainer']` -  Defaults to `Devops User <devops@optoro.com>`.
* `node['optoro_ruby']['package_256_sha']` -  Defaults to `dfb6657042d85337001b1df4cacb1734668cc7334a7f7d40ef9603462b3942dc`.
* `node['optoro_ruby']['s3_download_url']` -  Defaults to `s3_url`.
* `node['rvm']['global_gems']` -  Defaults to `[ ... ]`.
* `node['rvm']['default_ruby']` -  Defaults to `ruby-2.0.0-p598`.

# Recipes

* optoro_ruby::build
* optoro_ruby::build_package
* optoro_ruby::build_source
* optoro_ruby::bundler
* optoro_ruby::default
* optoro_ruby::install_package
* optoro_ruby::rvm

# License and Maintainer

Maintainer:: Optoro (<devops@optoro.com>)

License:: MIT
