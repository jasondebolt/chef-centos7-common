#
# Cookbook Name:: chef-centos7-common
# Recipe:: sudo
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# Enable 'kitchen verify' to run an an Amazon Centos7 EC2 instance...
execute 'sed the sudoers file' do
  command "sed -i 's/ requiretty/!requiretty/g' /etc/sudoers"
  user 'root'
end

# SUDO RECIPE DOES NOT WORK!!
#sudoers_defaults = [
#  "env_reset",
#  "!requiretty"
#]
#
#sudo_users = ["centos", "vagrant"]
#sudo_groups = ["centos", "adm", "wheel", "sysadmin"]
#
#node.default["authorization"] = {
#  "sudo" => {
#    "groups" => sudo_groups,
#    "users" => sudo_users,
#    "sudoers_defaults" => sudoers_defaults,
#	   "passwordless" => "true"
#  }
#}
