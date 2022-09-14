#! /usr/bin/bash

proxy() {
  if [[ $http_proxy == ""  ]]; then
    # 36 is virtual machine network segment
    if [[ $(ip a | grep "36") ]]; then
      export http_proxy=http://192.168.1.4:7890
      export https_proxy=http://192.168.1.4:7890
    else
      export http_proxy=http://127.0.0.1:7890
      export https_proxy=http://127.0.0.1:7890
    fi
  fi
}

if [[ ! -d /usr/share/fonts/mdd ]]; then
  sudo cp -r ~/.dotfiles/fonts/* /usr/share/fonts
  sudo fc-cache
fi

symbol_link() {
  if [[ -e $2 ]]; then
    rm $2
    ln -s $1 $2
  else
    ln -s $1 $2
  fi
}

symbol_link ~/.dotfiles/.zshrc ~/.zshrc
symbol_link ~/.dotfiles/.p10k.zsh ~/.p10k.zsh
symbol_link ~/.dotfiles/.vimrc ~/.vimrc
symbol_link ~/.dotfiles/.tmux.conf ~/.tmux.conf
symbol_link ~/.dotfiles/.gitconfig ~/.gitconfig
symbol_link ~/.dotfiles/nvim ~/.config/nvim
symbol_link ~/.dotfiles/kitty ~/.config/kitty
symbol_link ~/.dotfiles/wezterm ~/.config/wezterm
symbol_link ~/.dotfiles/i3 ~/.config/i3
symbol_link ~/.dotfiles/i3status ~/.config/i3status
symbol_link ~/.dotfiles/rofi ~/.config/rofi
