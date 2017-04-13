#
# Cookbook Name:: chef-centos7-common
# Recipe:: dotfiles
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

package 'git'
package 'vim-enhanced'

vagrant = File.exist? "/home/vagrant"

if vagrant
  git '/home/vagrant/dotfiles' do
    repository 'https://github.com/jasondebolt/dotfiles.git'
    revision 'master'
    action :sync
    user 'vagrant'
    group 'vagrant'
  end
  execute "cp -R /home/vagrant/dotfiles/.[^.]* /home/vagrant"
  execute "rm -Rf /home/vagrant/.git"
else
  git '/home/centos/dotfiles' do
    repository 'https://github.com/jasondebolt/dotfiles.git'
    revision 'master'
    action :sync
    user 'centos'
    group 'centos'
  end
  execute "cp -R /home/centos/dotfiles/.[^.]* /home/centos"
  execute "rm -Rf /home/centos/.git"
end