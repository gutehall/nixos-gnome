#!/bin/bash

USER="mathias"

# ultimate vimrc
sudo -u ${USER} git clone --depth=1 https://github.com/amix/vimrc.git /home/${USER}/.vim_runtime
sudo -u ${USER} sh /home/${USER}/.vim_runtime/install_awesome_vimrc.sh

# oh my zsh
sudo -u ${USER} sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# zsh plugin
sudo -u ${USER} git clone https://github.com/zsh-users/zsh-autosuggestions /home/${USER}/.oh-my-zsh/custom/plugins/zsh-autosuggestions
sudo -u ${USER} git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/${USER}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
sudo -u ${USER} git clone https://github.com/MohamedElashri/exa-zsh /home/${USER}/.oh-my-zsh/custom/plugins/exa-zsh
