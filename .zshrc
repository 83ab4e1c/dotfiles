# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
#bindkey -v
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':ompletion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# plugin
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/powerlevel10k/powerlevel10k.zsh-theme


# alias
alias ls="ls --color=auto"
alias ll="ls -lh --color=auto"
alias la="ls -Alh --color=auto"
alias reload="source ~/.zshrc"
alias vi="nvim"
# virtual machine
alias vp="export http_proxy=http://192.168.0.102:7890;export https_proxy=http://192.168.0.102:7890"
# physical machine
alias pp="export http_proxy=http://127.0.0.1:7890;export https_proxy=http://127.0.0.1:7890"
alias up="unset http_proxy;unset https_proxy"
alias install="sudo apt install -y"
alias update="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y"
# environment variable
. "$HOME/.cargo/env"

case ":${PATH}:" in
  *:"/usr/local/lua_lsp/bin":*)
    ;;
  *)
    export PATH="/usr/local/lua_lsp/bin:$HOME/go/bin:$PATH"
    ;;

  esac
  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# eval $(starship init zsh)
