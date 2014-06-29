#
# Cookbook Name:: groovebasin
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

stamp = `date +%s`.strip
user = node['current_user']
working = "/Users/#{user}/groovebasin"

git "#{working}" do
  repository "https://github.com/andrewrk/groovebasin.git"
  reference "master"
end

script 'build' do
  interpreter "bash"
  user "fire"
  cwd "#{working}"
  code <<-EOH
  npm run build
  EOH
end
