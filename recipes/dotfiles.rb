#
# Cookbook Name:: chef-centos7-common
# Recipe:: dotfiles
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

include_recipe "chef-centos7-common::packages"

vagrant = File.exist? '/home/vagrant'
centos = File.exists? '/home/centos'
amazon = File.exists? '/home/ec2-user'

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
elsif centos
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
elsif amazon # Amazon
  git '/home/ec2-user/dotfiles' do
    repository 'https://github.com/jasondebolt/dotfiles.git'
    revision 'master'
    action :sync
    user 'ec2-user'
    group 'ec2-user'
  end
  execute 'cp -R /home/ec2-user/dotfiles/.[^.]* /home/ec2-user' do
    user 'ec2-user'
  end
  execute 'rm -Rf /home/ec2-user/.git' do
    user 'ec2-user'
  end
end
