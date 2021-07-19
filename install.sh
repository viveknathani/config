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

printf "Go needs to be installed. Give path to downloaded .tar.gz file: "
read GO_DOWNLOAD_PATH

sudo tar -C /usr/local/ GO_DOWNLOAD_PATH

echo "Things that require manual setup:"
echo "1. Get the SSH key and set it up with any application that requires it."
echo "2. Setup github.com/viveknathani/hello"
echo "3. Terminal background is black."
echo "4. Monaco font face."

