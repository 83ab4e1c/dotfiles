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

sudo apt update && sudo apt upgrade -y
if [[ -f /usr/bin/plasmashell ]]; then
  sudo apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting golang nodejs npm python3-pip wget curl unzip
  sudo apt install -y fcitx5 fcitx5-config-qt fcitx5-pinyin i3 feh rofi kitty
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

  TAG=$(curl -sS https://github.com/kovidgoyal/kitty | grep -Po '(?<=\>version ).*(?=<\/)')
  URL="https://github.com/kovidgoyal/kitty/releases/download/v${TAG}/kitty-${TAG}-x86_64.txz"
  wget ${URL}
  tar -xf kitty-${TAG}-x86_64.txz -C /usr
fi

# install nvim
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb
sudo apt install -y ./nvim-linux64.deb

#if [[ -f /usr/bin/i3 ]]; then
#  echo "Xft.dpi: 192" > ~/.Xresources
#  echo -e "xrdb -merge ~/.Xresources \nexec i3" > ~/.xinitrc
#fi

