name 'chef-centos7-common'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'all_rights'
description 'Installs/Configures chef-centos7-common'
long_description 'Installs/Configures chef-centos7-common'
version '0.1.4'

issues_url 'https://github.com/jasondebolt/chef-centos7-common/issues' if respond_to?(:issues_url)
source_url 'https://github.com/jasondebolt/chef-centos7-common' if respond_to?(:source_url)

depends 'git'
depends 'users'
depends 'screen'
#depends 'sudo', '~> 3.3.1' # DOES NOT WORK ON CENTOS 7!
