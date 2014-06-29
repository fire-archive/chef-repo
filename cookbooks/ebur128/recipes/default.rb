#
# Cookbook Name:: ebur128
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

stamp = `date +%s`.strip
build_working = "/tmp/ebur128-#{stamp}"
include_recipe "homebrew"

package 'ninja' do
  action :install
end

package 'cmake' do
  action :install
end

package 'speex' do
  action :install
end

git "#{build_working}" do
  repository "https://github.com/jiixyj/libebur128"
  reference "master"
end

build = "#{build_working}/Build"

directory "#{build}" do
end

script 'build' do
  interpreter "bash"
  user "fire"
  cwd "#{build_working}/Build"
  code <<-EOH
  cmake -G Ninja #{build_working}
  ninja
  ninja install
  EOH
end

directory "#{build_working}" do
  recursive true
  action :delete
end
