#!/bin/sh

sudo apt-get -y update

sudo apt-get -y install build-essentials

sudo apt-get -y install python3-pip
sudo apt-get -y install gdb gdb-multiarch
sudo apt-get -y install unzip
sudo apt-get -y install foremost
sudo apt-get -y install python2.7 python-pip python-dev git libssl-dev libffi-dev
sudo apt-get -y install wget curl

mkdir -p /home/$USER/tools

# GDB
git clone https://github.com/longld/peda.git /home/$USER/tools/peda
echo "#source ~/tools/peda/peda.py" >> /home/$USER/.gdbinit

wget -O /home/$USER/tools/gef.py -q https://github.com/hugsy/gef/raw/master/gef.py
echo "source ~/tools/gef.py" >> /home/$USER/.gdbinit

git clone https://github.com/hugsy/gef-extras.git /home/$USER/tools/gef-extras
gdb -ex 'gef config gef.extra_plugins_dir "/home/$USER/tools/gef-extras/scripts"' -ex 'gef save' -ex quit
gdb -ex 'gef config pcustom.struct_path "/home/$USER/tools/gef-extras/structs"' -ex 'gef save' -ex quit

pip2 install capstone unicorn keystone-engine ropper
pip3 install capstone unicorn keystone-engine ropper
sudo apt-get -y install libcapstone-dev

git clone https://github.com/radare/radare2 /home/$USER/tools/radare2
cd /home/$USER/tools/radare2
./sys/install.sh
pip install r2pipe

git clone https://github.com/ReFirmLabs/binwalk /home/$USER/tools/binwalk
cd /home/$USER/tools/binwalk
sudo python setup.py install
sudo apt-get -y install squashfs-tools
sudo apt-get -y install python-lzma

sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get -y install libc6:i386 libncurses5:i386 libstdc++6:i386
sudo apt-get -y install libc6-dev-i386

sudo apt-get -y install p7zip-full vbindiff
sudo apt-get -y install imagemagick

pip install z3-solver
pip install pwntools

