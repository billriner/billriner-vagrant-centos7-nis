# billriner-vagrant-centos7-nis
CentOS7 minimal installation configured to use CSB NIS

To create a CentOS minimal VM using the VirtualBox provider that binds to the CSB NIS domain: 
- $ git clone https://github.com/billriner/billriner-vagrant-centos7-nis.git
- Set an unused MAC address in the Vagrantfile, get a static IP for that MAC, and add the host to NIS
- $ vagrant up
- $ vagrant ssh
- Log in using the password 'vagrant'
- Set the root password
- Disable the vagrant user account
