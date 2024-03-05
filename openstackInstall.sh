#!/bin/bash
sudo useradd -s /bin/bash -d /opt/stack -m stack
sudo chmod -R 750 /opt/stack
echo "### STEP 1 DONE!" 

echo "stack ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/stack 
sudo -u stack -i
echo "### STEP 2 DONE!" 

git clone https://opendev.org/openstack/devstack 
cd devstack 

wget https://github.com/LeslieGonye/OpenStack/blob/main/local.conf
echo "### STEP 3 DONE!" 

./devstack/stack.sh 

echo "IMPORTANT - Change Password for ADMIN_PASSWORD 
DATABASE_PASSWORD 
RABBIT_PASSWORD 
SERVICE_PASSWORD 

Using nano /devstack/local.conf" 

echo "### INSTALLATION COMPLETED!.............."
