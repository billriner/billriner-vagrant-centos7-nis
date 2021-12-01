# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Use the CentOS 7 box
  config.vm.box = "bento/centos-7.7"

  # Hostname
  config.vm.hostname = "gumbo.csb.vanderbilt.edu"

  # Create a public bridge network so VM will be on the network
  config.vm.network "public_network", :bridge => 'em1', :mac => "080027b4d8fd"

  # Provider-specific configuration  for Virtualbox

  config.vm.provider "virtualbox" do |vb|

    # Set the name in the VirtualBox GUI
    vb.name = "gumbo - CentOS 7 NIS client"
  
    # NIC type
    vb.default_nic_type = "virtio"

    # Number of CPUs
    vb.cpus = 1

    # Customize the amount of memory on the VM:
    vb.memory = "1024"
    
    # Don't display the VirtualBox GUI when booting the machine
    vb.gui = false

    # VBoxManage customizations

      # Description
      vb.customize ["modifyvm", :id, "--description", "CentOS minimal installation configured to use NIS."]
      # CPU execution cap
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]

  end

  # Provision using a shell script
  config.vm.provision "shell", path: "setup-nis.sh"

  config.vm.provision "shell", inline: <<-SHELL
    echo "Be sure to:"
    echo "  1. Set a password for the root user."
    echo "  2. Disable the vagrant user account."
  SHELL

end
