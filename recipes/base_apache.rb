#
# Cookbook Name:: jruby_base
# Recipe:: base_apache
#
# Copyright (c) 2016 The Authors, All Rights Reserved.



case node.platform
  when "ubuntu"
    package "apache2"
    service "apache2" do
      action [:enable, :start]
    end
  when "centos"
    package "httpd"
    service "httpd" do
      action [:enable, :start]
    end
end
