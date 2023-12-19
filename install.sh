#!/bin/bash

USER="mathias"

# aws cli
curl https://awscli.amazonaws.com/"$PACKAGE_NAME".zip -o "awscliv2.zip"
unzip -q awscliv2.zip
sudo ./aws/install
rm -rf aws*

# ultimate vimrc
git clone --depth=1 https://github.com/amix/vimrc.git /home/${USER}/.vim_runtime
sh /home/${USER}/.vim_runtime/install_awesome_vimrc.sh

# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# zsh plugin
git clone https://github.com/zsh-users/zsh-autosuggestions /home/${USER}/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/${USER}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/MohamedElashri/exa-zsh /home/${USER}/.oh-my-zsh/custom/plugins/exa-zsh