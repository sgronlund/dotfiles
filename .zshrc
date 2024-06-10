autoload -U colors && colors
source /home/frost/Dev/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /home/frost/Dev/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# history setup
setopt SHARE_HISTORY
setopt EXTENDED_GLOB
SAVEHIST=12000
HISTSIZE=10000
HISTFILE=~/.zsh_history
export PATH="${PATH}:${HOME}/.local/bin/"
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre"

# Ease updating all the packages
alias cat="bat"
alias up="sudo apt update && sudo apt upgrade && sudo apt autoremove"
alias updot="cp ~/.zshrc ~/Dev/dotfiles/ && cp -r ~/.config/alacritty/ ~/Dev/dotfiles/ && cp -r ~/.config/i3/ ~/Dev/dotfiles/ && cp -r ~/.config/polybar ~/Dev/dotfiles && cp -r ~/.config/picom ~/Dev/dotfiles && cp -r ~/.config/scripts ~/Dev/dotfiles && cp -r ~/.config/nvim/ ~/Dev/dotfiles/ && cp -r ~/.config/rofi/ ~/Dev/dotfiles/ && cp -r ~/.config/dunst ~/Dev/dotfiles/ && cp -r ~/Dev/dwm/*~.git ~/Dev/dotfiles/suckless/dwm/  && cp -r ~/Dev/slstatus/*~.git ~/Dev/dotfiles/suckless/slstatus/ && cp -r ~/Dev/st-flexipatch/*~.git ~/Dev/dotfiles/suckless/st/  "
# change brightness
alias light="brightness-controller"
alias nnn="nnn -denA -T t"
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
alias gcl="git clone "
alias gl="git pull"
alias gp="git push"
alias gcb="git checkout -b"
alias gd="git diff"
alias ls="exa -lahS"
alias gcm="git commit -m"
alias fd="fdfind"
alias lg="lazygit"
# this alias can be used efficiently within a repo 
# that has been cloned with the usage of --bare
# note that this alias also creates a new branch
alias gwab="git worktree add -b"
alias gwa="git worktree add"
alias gwl="git worktree list"
#usage would be something like cheat python/pandas+csv and
#you'd get results for common csv operations when using 
#pandas
cheat ()
{
	curl "cht.sh/$1"
}

gen_gitignore ()
{
    list=$(curl -s "https://www.toptal.com/developers/gitignore/api/list")
    str=$1
    parts=("${(@s:,:)str}")
    real_parts=""
    for idx in {1..$#parts}
    do
        if echo "$list" | grep -q "$parts[idx]" ; then
            if [[ $idx == 1 ]]; then
                real_parts="${real_parts}${parts[idx]}"
            else 
                real_parts="${real_parts},${parts[idx]}"
            fi
	fi
    done
    wget -q "https://www.toptal.com/developers/gitignore/api/$real_parts" -O .gitignore
}
fpath+=($HOME/Dev/pure)
# .zshrc
autoload -U promptinit; promptinit
prompt pure

#nerd alias
alias vim="nvim"
alias matlab="matlab -nodesktop"
alias v3="vim ~/.config/i3/config"
alias vp="vim ~/.config/polybar/config.ini"
alias vz="vim ~/.zshrc"
venv(){
    if [[ -d .venv ]]; then
        source .venv/bin/activate
    else
        uv venv
        source .venv/bin/activate
    fi
}
alias sdi="sudo dpkg -i"
. "$HOME/.cargo/env"
export PATH="${PATH}:${HOME}/Dev/"
export PATH="${PATH}:${HOME}/Dev/lazygit/"
export PATH="${PATH}:${HOME}/.config/scripts/"


eval "$(zoxide init zsh)"
eval "$(~/.local/bin/mise activate zsh)"
