#!/bin/bash

#-------------------------------------------------------------------------------
#
# setup-nis.sh - Configures CentOS 7 for NIS
#
#-------------------------------------------------------------------------------

# Update all packages

#yum -y update

#-------------------------------------------------------------------------------

# Set the NIS domain name

ypdomainname structbio

#-------------------------------------------------------------------------------

# Install required packages

yum -y install autofs nfs-utils ypbind

#-------------------------------------------------------------------------------

# Config files

echo "NISDOMAIN=structbio" >> /etc/sysconfig/network

cat > /etc/resolv.conf <<EOI
search csb.vanderbilt.edu its.vanderbilt.edu vanderbilt.edu
nameserver 10.2.189.78
nameserver 10.4.162.82
EOI

cat > /etc/securenets <<EOI
host 127.0.0.1
255.255.0.0   129.59.0.0
255.255.0.0   160.129.0.0
255.0.0.0     10.0.0.0
EOI

cat > /etc/security/access.netgroup.conf <<EOI
+ : sbio root ansible : ALL
- : ALL : ALL
EOI

#-------------------------------------------------------------------------------

# Use NIS

authconfig --enablenis \
           --nisdomain=structbio \
           --nisserver=nis.csb.vanderbilt.edu \
           --update

#-------------------------------------------------------------------------------

# Enable and start services

systemctl enable autofs nfs rpcbind ypbind
systemctl start autofs nfs rpcbind ypbind
