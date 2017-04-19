#
# Cookbook Name:: chef-centos7-common
# Recipe:: dotfiles
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

include_recipe "chef-centos7-common::packages"

vagrant = File.exist? '/home/vagrant'

if vagrant
  git '/home/vagrant/dotfiles' do
    repository 'https://github.com/jasondebolt/dotfiles.git'
    revision 'master'
    action :sync
    user 'vagrant'
    group 'vagrant'
  end
  execute 'cp -R /home/vagrant/dotfiles/.[^.]* /home/vagrant' do
    user 'vagrant'
  end
  execute 'rm -Rf /home/vagrant/.git' do
    user 'vagrant'
  end
else
  git '/home/centos/dotfiles' do
    repository 'https://github.com/jasondebolt/dotfiles.git'
    revision 'master'
    action :sync
    user 'centos'
    group 'centos'
  end
  execute 'cp -R /home/centos/dotfiles/.[^.]* /home/centos' do
    user 'centos'
  end
  execute 'rm -Rf /home/centos/.git' do
    user 'centos'
  end
end
