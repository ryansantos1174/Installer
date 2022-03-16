#!/bin/bash

#Updating apt
apt update
apt install snapd
systemctl start snapd
systemctl enable snapd
# Might have to log out and log back in here

#Installing python libraries
pip install h5py
pip install ipython
pip install jedi
pip install keras
pip install matplotlib
pip install numpy
pip install pandas
pip install scipy
pip install sympy
pip install tensorflow

#Installing Emacs
apt-get install emacs
snap install discord
snap install pycharm-community
snap install teams
apt install firefox
snap install zoom-client
snap install slack 

#Installing Dropbox
cd ~ && wget -0 - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd



