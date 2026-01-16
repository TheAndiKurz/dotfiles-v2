#!/usr/bin/env bash

sudo apt install fzf

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
ln -sf ~/dotfiles/dot-fonts ~/.fonts

ln -sf ~/dotfiles/dot-config/chromium-flags.conf ~/.config/
ln -sf ~/dotfiles/dot-config/fontconfig ~/.config/
ln -sf ~/dotfiles/dot-config/ghostty ~/.config/
ln -sf ~/dotfiles/dot-config/zed ~/.config/

source ~/.bashrc
