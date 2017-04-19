#
# Cookbook Name:: chef-centos7-common
# Spec:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'chef-centos7-common::dotfiles' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.2.1511')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'should sync a dotfiles git repo' do
      expect(chef_run).to sync_git('/home/centos/dotfiles')
    end

    it 'should execute the copy command' do
      expect(chef_run).to run_execute('cp -R /home/centos/dotfiles/.[^.]* /home/centos').with(user: 'centos')
    end

    it 'should remove the .git directory from the destination directory' do
      expect(chef_run).to run_execute('rm -Rf /home/centos/.git').with(user: 'centos')
    end

  end
end
