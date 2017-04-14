# # encoding: utf-8

# Inspec test for recipe chef-centos7-common::packages

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html


describe package 'git' do
  it { should be_installed }
end

describe package 'wget' do
  it { should be_installed }
end

describe package 'vim-enhanced' do
  it { should be_installed }
end
