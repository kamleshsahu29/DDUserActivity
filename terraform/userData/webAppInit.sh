#! /bin/bash
script ~/WebAppInit.log

sudo apt-get update
sudo apt-get install language-pack-UTF-8
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
sudo apt-get install -y wget python3 python3-pip
pip3 install boto3 cherrypy
mkdir webApp
cd webApp
exit
exit



