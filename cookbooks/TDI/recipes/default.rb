#
# Cookbook Name:: TDI
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
user 'tdi' do 
  action :create
  home "/home/tdi"
  supports :manage_home => true
end

package 'irssi' do
  action :install
end

directory '/home/tdi/.irssi' do
  owner 'tdi'
  group 'tdi'
  action :create
end


cookbook_file '/home/tdi/.irssi/config' do
  source 'irssi-config'
  owner 'tdi'
  group 'tdi'
  action :create
end
