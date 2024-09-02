#!/bin/bash

# Paths
VIMRC_PATH=~/.vim_runtime
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
ZSH_CUSTOM_PLUGINS="$ZSH_CUSTOM/plugins"
SOURCES_PATH=./sources
NIXOS_CONFIG_PATH=~/nixos
BACKUP_PATH=/etc/nixos.bak

# Remove .oh-my-zsh if it exists
if [ -d "$HOME/.oh-my-zsh" ]; then
    rm -rf "$HOME/.oh-my-zsh"
fi

# Clone repositories
clone_repositories() {
    declare -A repositories=(
        ["https://github.com/amix/vimrc.git"]=$VIMRC_PATH
        ["https://github.com/zsh-users/zsh-autosuggestions"]=$ZSH_CUSTOM_PLUGINS/zsh-autosuggestions
        ["https://github.com/zsh-users/zsh-syntax-highlighting.git"]=$ZSH_CUSTOM_PLUGINS/zsh-syntax-highlighting
        ["https://github.com/MohamedElashri/exa-zsh"]=$ZSH_CUSTOM_PLUGINS/exa-zsh
    )

    for repo_url in "${!repositories[@]}"; do
        destination="${repositories[$repo_url]}"
        git clone --depth=1 "$repo_url" "$destination" &
    done

    wait # Ensure all cloning processes are complete
}

# Clone repositories in parallel
clone_repositories

# Install Oh My Zsh if not already installed
if [ ! -d "$ZSH_CUSTOM" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install Home Manager if not already installed
if ! command -v home-manager &> /dev/null; then
    sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
    sudo nix-channel --update
    nix-shell '<home-manager>' -A install
fi

# Copy configuration files
cp "$SOURCES_PATH/.zshrc" ~/
cp "$SOURCES_PATH/.vimrc" ~/
cp "$SOURCES_PATH/bullet-train.zsh-theme" "$ZSH_CUSTOM/themes/"

# Backup and link NixOS configuration
sudo cp /etc/nixos/hardware-configuration.nix "$NIXOS_CONFIG_PATH"
sudo mv /etc/nixos "$BACKUP_PATH"
sudo ln -s "$NIXOS_CONFIG_PATH" /etc/nixos

# Rebuild NixOS
sudo nixos-rebuild switch
