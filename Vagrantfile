# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64-gui"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "https://s3.amazonaws.com/seda-vagrant-boxes/precise64-gui-vision-all.box" 

  # Required tools install
  config.vm.provision "shell", path:"./setup.sh"
  # Detect which package installs to cache
  config.cache.auto_detect = true
  # Limit scope to one machine
  config.cache.scope = :machine
  # Hard enable apt
  config.cache.enable :apt

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 8080

  # Create a usb filter. This filter applies to usb devices with a Logitech vendorid
  #config.vm.provider :virtualbox do |vb|
  #  vb.customize ['modifyvm', :id, '--usb', 'on']
  #  vb.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'Logitech', '--vendorid', '0x046d']
  #end

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network :private_network, ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  # Uncomment to use a GUI
  config.vm.provider :virtualbox do |vb|
    vb.name = "SEDA-CV-TextDetection"
    vb.gui = true
    vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
    vb.customize ["modifyvm", :id, "--usb", "on", "--usbehci", "on"]
  end

end
