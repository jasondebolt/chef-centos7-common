#
# Cookbook Name:: chef-centos7-common
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

package 'git'

include_recipe "chef-centos7-common::sudo"
include_recipe "chef-centos7-common::dotfiles"
