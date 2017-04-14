#
# Cookbook Name:: chef-centos7-common
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.


include_recipe 'chef-centos7-common::packages'
include_recipe 'chef-centos7-common::sudo'
include_recipe 'chef-centos7-common::dotfiles'
