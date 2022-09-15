#! /usr/bin/bash

init() {
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

  sudo apt update && sudo apt upgrade -y
  if [[ -f /usr/bin/plasmashell ]]; then
    sudo apt install -y fcitx5 fcitx5-config-qt fcitx5-pinyin i3 feh rofi kitty

    TAG=$(curl -sS https://github.com/kovidgoyal/kitty | grep -Po '(?<=\>version ).*(?=<\/)')
    URL="https://github.com/kovidgoyal/kitty/releases/download/v${TAG}/kitty-${TAG}-x86_64.txz"
    wget ${URL}
    sudo tar -xf kitty-${TAG}-x86_64.txz -C /usr
    echo "Xft.dpi: 192" > ~/.Xresources
    echo -e "xrdb -merge ~/.Xresources \nexec i3" > ~/.xinitrc
  fi
  sudo apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting golang nodejs npm python3-pip wget curl unzip
  wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb
  sudo apt install -y ./nvim-linux64.deb
  sudo chsh -s /usr/bin/zsh mdd
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git
  sudo mv powerlevel10k /usr/share/

  npm config set registry https://mirrors.huaweicloud.com/repository/npm/
  sudo npm config set registry https://mirrors.huaweicloud.com/repository/npm/
  pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
  sudo pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
  go env -w GO111MODULE=on
  go env -w GOPROXY=https://goproxy.cn,direct
  sudo go env -w GO111MODULE=on
  sudo go env -w GOPROXY=https://goproxy.cn,direct
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
