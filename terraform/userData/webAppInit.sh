#! /bin/bash
sudo apt-get update
export LC_ALL="en_US.UTF-8" 
export LC_CTYPE="en_US.UTF-8" 
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export AWS_DEFAULT_REGION="ap-southeast-1"
sudo apt-get install -y wget python3 python3-pip
pip3 install boto3 cherrypy
mkdir /home/ubuntu/webApp
cd /home/ubuntu/webApp
wget "https://raw.githubusercontent.com/kamleshsahu29/DDUserActivity/main/webApp/__init__.py" --no-check-certificate 
nohup python3 __init__.py &




