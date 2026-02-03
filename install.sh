#!/usr/bin/env bash

# to run this you need the following programs pre installed
# - konsave (if you want the kde config)
# - nushell

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

if ! hash konsave 2>/dev/null; then
    konsave -r theandikurz
    konsave -i theandikurz.knsv
fi

if ! hash starship 2>/dev/null; then
    curl -sS https://starship.rs/install.sh | sh
fi

source ~/.bashrc
