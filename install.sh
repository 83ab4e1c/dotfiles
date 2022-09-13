#! /usr/bin/bash

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


if [[ ! -d /usr/share/fonts/mdd ]]; then
  sudo cp -r ~/.dotfiles/fonts/* /usr/share/fonts
  sudo fc-cache
fi

if [[ -e ~/.config/nvim ]]; then
  rm -rf ~/.config/nvim ~/.config/kitty ~/.config/wezterm ~/.config/i3 ~/.config/i3status ~/.config/rofi
  ln -sf ~/.dotfiles/.zshrc ~/.zshrc
  ln -sf ~/.dotfiles/.p10k.zsh ~/.p10k.zsh
  ln -sf ~/.dotfiles/.vimrc ~/.vimrc
  ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
  ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
  ln -s ~/.dotfiles/nvim ~/.config/nvim
  ln -s ~/.dotfiles/kitty ~/.config/kitty
  ln -s ~/.dotfiles/wezterm ~/.config/wezterm
  ln -s ~/.dotfiles/i3 ~/.config/i3
  ln -s ~/.dotfiles/i3status ~/.config/i3status
  ln -s ~/.dotfiles/rofi ~/.config/rofi
fi
