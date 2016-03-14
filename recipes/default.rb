#
# Cookbook Name:: jruby_base
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


ruby_block 'jruby' do
  block do
    require "open-uri"
    FILES = [ "jruby-bin-1.7.24.tar.gz" ]

    FILES.each{|file|
      IO.copy_stream(open("https://s3.amazonaws.com/jruby.org/downloads/1.7.24/#{file}"), "/opt/jruby.tar.gz")
    }
    `tar -xzvf /opt/jruby.tar.gz -C /opt`
  end
end

ruby_block 'apt-get_update' do
  block do
    if node.platform == "ubuntu"
      `apt-get update`
    end
  end
end

package "jdk" do
  case node.platform
    when "ubuntu", "debian"
      package_name "openjdk-7-jdk"
    when "centos", "rhel"
      package_name "java-1.8.0-openjdk.x86_64"
  end
end

include_recipe "jruby_base::base_apache"
include_recipe "tomcat-all::default"



