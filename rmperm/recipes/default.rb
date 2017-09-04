#
# Cookbook:: rmperm
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

file "/etc/chef/client.pem" do
	action :delete
end

