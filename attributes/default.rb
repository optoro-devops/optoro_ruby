default[:optoro_ruby][:install_method] = 'build_source'
default[:optoro_ruby][:ruby_major_version] = '2.1'
default[:optoro_ruby][:ruby_minor_version] = '2'
default[:optoro_ruby][:ruby_full_version] = "#{default[:optoro_ruby][:ruby_major_version]}.#{default[:optoro_ruby][:ruby_minor_version]}"
default[:optoro_ruby][:source_name] = "ruby-#{default[:optoro_ruby][:ruby_full_version]}.tar.gz"
default[:optoro_ruby][:source_directory] = "/tmp/ruby-#{default[:optoro_ruby][:ruby_full_version]}"
default[:optoro_ruby][:download_url] = "http://cache.ruby-lang.org/pub/ruby/#{node[:optoro_ruby][:ruby_major_version]}/#{default[:optoro_ruby][:source_name]}"

default[:optoro_ruby][:source_sha256_sum] = "f22a6447811a81f3c808d1c2a5ce3b5f5f0955c68c9a749182feb425589e6635"

default[:optoro_ruby][:source_dependencies] = %w[
  zlib1g-dev libssl-dev libreadline-dev
  libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev
  libcurl4-openssl-dev
]

default[:optoro_ruby][:debian_build_dependencies] = %w[
  build-essential autoconf automake autotools-dev dh-make
  debhelper devscripts fakeroot xutils lintian pbuilder
  curl
]

default[:optoro_ruby][:maintainer] = "Devops User <devops@optoro.com>"

default[:optoro_ruby][:package_2_1_2_256_sha] = "dfb6657042d85337001b1df4cacb1734668cc7334a7f7d40ef9603462b3942dc"

default[:optoro_ruby][:s3_download_url] = "https://s3.amazonaws.com/optoro-devops/ruby_packages/ruby_#{node[:optoro_ruby][:ruby_full_version]}-1_amd64.deb"
