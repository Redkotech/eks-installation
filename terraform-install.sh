#!/bin/bash
# install terraform in ubuntu server
sudo apt install wget unzip -y
wget https://releases.hashicorp.com/terraform/1.3.3/terraform_1.3.3_linux_arm64.zip
sudo unzip terraform_1.3.3_linux_arm64.zip -d /usr/local/bin/
#Export terraform binary path temporally
export PATH=$PATH:/usr/local/bin
#Add path permanently for current user.By Exporting path in .bashrc file at end of file.
 echo  "export PATH=$PATH:/usr/local/bin" >> ~/.bashrc
# Source .bashrc to reflect for current session
 source ~/.bashrc 
 terraform -version
