sudo apt -y update
sudo apt -y upgrade
sudo apt -y install build-essential
sudo apt -y install vim

printf "\nInstalling node.js via nvm\n"
printf "Add URL to install_nvm.sh: "
read NVM_URL 
curl -sL $NVM_URL
bash install_nvm.sh
source ~/.bashrc
nvm ls-remote

printf "Pick a version number to install: "
read VERSION 
nvm install $VERSION