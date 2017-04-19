#
# Cookbook Name:: chef-centos7-common
# Spec:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'chef-centos7-common::sudo' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.2.1511')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'should sed the /etc/sudoers file' do
      expect(chef_run).to run_execute("sed -i 's/ requiretty/!requiretty/g' /etc/sudoers").with(user: 'root')
    end
  end
end
