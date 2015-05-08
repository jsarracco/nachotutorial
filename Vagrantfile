# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  # Enable boostrap
  config.vm.provision :shell, :path => "script/vagrant-bootstrap.sh"

  config.vm.network :private_network, ip: "10.11.12.4"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  config.vm.synced_folder "./", "/vagrant", :owner => "www-data", :group => "www-data"
end
