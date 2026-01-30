#!/usr/bin/env bash

# konsave
if ! hash konsave 2>/dev/null; then
    if hash yay 2>/dev/null; then
        yay -S konsave
    else 
        echo "Install konsave"
        exit
    fi
fi

# zoxide
if ! hash zoxide 2>/dev/null; then
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi

if [ -e ~/.bashrc ] && [ ! -L ~/.bashrc ]; then
    echo "Moving current .bashrc to .bashrc.bkp"
    mv ~/.bashrc ~/.bashrc.bkp
fi
ln -sf ~/dotfiles/dot-bashrc ~/.bashrc
ln -sf ~/dotfiles/dot-gitconfig ~/.gitconfig

ln -sf ~/dotfiles/dot-config/chromium-flags.conf ~/.config/
ln -sf ~/dotfiles/dot-config/fontconfig ~/.config/
ln -sf ~/dotfiles/dot-config/ghostty ~/.config/
ln -sf ~/dotfiles/dot-config/zed ~/.config/
ln -sf ~/dotfiles/dot-config/nushell ~/.config/

konsave -r theandikurz
konsave -i theandikurz.knsv

source ~/.bashrc
