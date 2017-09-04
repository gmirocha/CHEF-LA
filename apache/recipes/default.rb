#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#
package "httpd" do
	action :install
end

node["apache"]["sites"].each do|sitename,data|
	document_root = "/content/sites/#{sitename}"
	directory document_root do
		mode "0755"
		recursive true
	end
	template "/etc/httpd/conf.d/#{sitename}.conf" do
		source "vhost.erb" 
		mode "0644"
		variables(
			:document_root =>document_root,
			:port => data["port"],
			:domain => data["domain"]
		)
		notifies :restart,"service[httpd]"
	end
	template "/content/sites/#{sitename}/index.html" do
		source "index.html.erb"
		mode "0644"
		variables(
			:site_title=> data["site_title"],
			:comingsoon => "Coming Soon, karaio"
		)
	end 
#### Template index
end

execute "rm /etc/httpd/conf.d/welcome.conf" do
	only_if do
		File.exist?("/etc/httpd/conf.d/welcome.conf")
	end
	notifies :restart,"service[httpd]"
end

execute "rm /etc/httpd/conf.d/README" do
	only_if do
		File.exist?("/etc/httpd/conf.d/README")
	end
end
service "httpd" do
	action [:enable, :start]
end

include_recipe "php::default"

