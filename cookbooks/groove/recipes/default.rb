#
# Cookbook Name:: groove
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

stamp = `date +%s`

git "/tmp/groove-#{stamp}" do
  repository "https://github.com/andrewrk/libgroove"
  reference "master"
end

include_recipe "homebrew"

package 'cmake' do
  action :install
end

package 'libav' do
  action :install
end

package 'chromaprint' do
  action :install
end

