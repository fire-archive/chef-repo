#
# Cookbook Name:: groove
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

stamp = `date +%s`.strip
groove_working = "/tmp/groove-#{stamp}"

git "#{groove_working}" do
  repository "https://github.com/fire/libgroove.git"
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

script 'build' do
  interpreter "bash"
  user "fire"
  cwd "#{groove_working}/Build"
  code <<-EOH
  cmake -G Ninja ../ && ninja && ninja install
  EOH
end

directory "#{groove_working}" do
  recursive true
  action :delete
end
