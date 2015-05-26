# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# Author: Russell Trow
# Created: 26 May 2015
#

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"

  # Network config
  config.vm.network :forwarded_port, guest: 9292, host: 9292
  config.vm.network :private_network, ip: "192.168.66.6"

  # Install Chef
  config.omnibus.chef_version = :latest

  # Provision using Chef Solo
  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "apt"
    chef.add_recipe "nano"
    chef.add_recipe "git"
    chef.add_recipe "screen"
    chef.add_recipe "build-essential"
    chef.add_recipe "openssl"
    chef.add_recipe "apache2"
    chef.add_recipe "postgresql::server"

    chef.json = {
      "apache" => {
        "docroot_dir" => "/vagrant/public",
        "default_site_enabled" => true,
        "sysconfig_additional_params" => { EnableSendfile: "Off" }
      },
      "postgresql" => {
        "password" => { "postgres" => "banana123" }
      }
    }
  end

  # Execute the bootstrap script to install
  config.vm.provision :shell, :privileged => false, :path => "bootstrap.sh"
end
