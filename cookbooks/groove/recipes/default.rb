#
# Cookbook Name:: groove
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

stamp = `date +%s`
groove_working = "/Users/fire/groove"

git "#{groove_working}" do
  repository "https://github.com/andrewrk/libgroove"
  reference "master"
end

include_recipe "homebrew"

package 'cmake' do
  action :install
end

package 'ninja' do
  action :install
end

package 'sdl2' do
  action :install
end

package 'libav' do
  action :install
end

package 'chromaprint' do
  action :install
end

directory "#{groove_working}/Build" do
end

execute 'build' do
  cwd "#{groove_working}/Build"
  command "cmake -G Ninja ../"
  command "ninja "
end
 
