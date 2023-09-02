autoload -U colors && colors
#source /home/sgronlu/Dev/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /home/sgronlu/Dev/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /home/sgronlu/Dev/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# history setup
setopt SHARE_HISTORY
SAVEHIST=12000
HISTSIZE=10000
HISTFILE=~/.zsh_history
export PATH="${PATH}:${HOME}/.local/bin/"
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre"

# Ease updating all the packages
alias up="sudo snap refresh && sudo apt update && sudo apt upgrade && sudo apt autoremove"
alias updot="cp ~/.zshrc ~/Dev/dotfiles/ && cp -r ~/.config/alacritty/ ~/Dev/dotfiles/ && cp -r ~/.config/i3/ ~/Dev/dotfiles/ && cp -r /home/sgronlu/.config/Code/User/sync/ ~/Dev/dotfiles/ && cp -r ~/.config/polybar ~/Dev/dotfiles && cp -r ~/.config/picom ~/Dev/dotfiles && cp -r ~/.config/scripts ~/Dev/dotfiles && cp -r ~/.config/nvim/lua/custom/ ~/Dev/dotfiles/ && cp -r ~/.config/rofi/ ~/Dev/dotfiles/ && cp -r ~/.config/dunst ~/Dev/dotfiles/"
# change brightness
alias light="brightness-controller"
alias nnn="nnn -de -T t"
export NNN_PLUG=""
export NNN_FIFO="/tmp/nnn.fifo"
export VISUAL="nvim"
export EDITOR="nvim"
alias lapoff="monitor.sh 2"
alias lapon="monitor.sh 1"
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gl="git pull"
alias gp="git push"
alias gcb="git checkout -b"
alias gd="git diff"
alias ls="exa -la"
alias gcam="git commit -a -m"

fpath+=($HOME/Dev/pure)
# .zshrc
autoload -U promptinit; promptinit
prompt pure

#nerd alias
alias vim="nvim"
alias matlab="matlab -nodesktop"
# (cat ~/.cache/wal/sequences &)
. "$HOME/.cargo/env"
export PATH="${PATH}:${HOME}/Dev/"
export PATH="${PATH}:${HOME}/.config/scripts/"

export NVM_DIR="$HOME/.nvm"
alias nvm="unalias nvm; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm $@"


# fix for ssh-agent
eval $(keychain --eval --agents ssh --quick --quiet)
