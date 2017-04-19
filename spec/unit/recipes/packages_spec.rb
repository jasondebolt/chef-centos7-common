#
# Cookbook Name:: chef-centos7-common
# Spec:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'chef-centos7-common::packages' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.2.1511')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'should install git' do
      expect(chef_run).to install_package('git')
    end

    it 'should install screen' do
      expect(chef_run).to install_package('screen')
    end

    it 'should install tree' do
      expect(chef_run).to install_package('tree')
    end

    it 'should install vim-enhanced' do
      expect(chef_run).to install_package('vim-enhanced')
    end

    it 'should install wget' do
      expect(chef_run).to install_package('wget')
    end

  end
end
