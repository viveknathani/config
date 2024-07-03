
# setting up symbolic links
ln -s ~/config/nvim ~/.config
ln -s ~/config/.bashrc ~/.bashrc

# install homebrew
echo "installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install git
echo "installing git..."
brew install git

# setting up git config
git config --global user.name "viveknathani"
git config --global user.email "viveknathani2402@gmail.com"

# node
echo "installing node..."
printf "\nadd url to install_nvm.sh: "
read NVM_URL 
curl -o- $NVM_URL | bash
bash install_nvm.sh
source ~/.bashrc
nvm ls-remote
printf "pick a version number to install: "
read VERSION 
nvm install $VERSION

# go
echo "installing go..."
printf "\nprovide the path to the downloaded .tar.gz file: "
read GO_DOWNLOAD_PATH

sudo tar -C /usr/local/ GO_DOWNLOAD_PATH

echo "things that require manual setup..."
echo "1. ssh keys on github/gitlab"
echo "2. fira code nerd font"

