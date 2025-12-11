autoload -U colors && colors
source /home/frost/Dev/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /home/frost/Dev/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh-vi-mode/zsh-vi-mode.plugin.zsh
zmodload zsh/complist
autoload -U compinit && compinit
# history setup
setopt SHARE_HISTORY
setopt EXTENDED_GLOB
SAVEHIST=12000
HISTSIZE=10000
HISTFILE=~/.zsh_history
export PATH="${PATH}:${HOME}/.local/bin/"
export PATH="${PATH}:${HOME}/Uni/ml-iot/arduino-ide/"
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre"
export MODEL_VIEWER_ROOT="$HOME/Uni/computer-graphics/gltf_viewer"
export RT_VIEWER_ROOT="$HOME/Uni/computer-graphics/project/rt_viewer"
export TMUXIFIER_LAYOUT_PATH="$HOME/dotfiles/.config/tmuxifier/"


# Ease updating all the packages
alias ts="tmuxifier s"
alias up="sudo apt update && sudo apt upgrade && sudo apt autoremove"
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
alias l="ls -la --color=always -h"
alias gcm="git commit -m"
alias fd="fdfind"
alias lg="lazygit"
alias rlang="R"
# this alias can be used efficiently within a repo 
# that has been cloned with the usage of --bare
# note that this alias also creates a new branch
alias gwab="git worktree add -b"
alias gwa="git worktree add"
alias gwl="git worktree list"
alias day="xsct 0"
alias night="xsct 1600"
#usage would be something like cheat python/pandas+csv and
#you'd get results for common csv operations when using 
#pandas
cheat ()
{
	curl "cht.sh/$1"
}
# usage here i gen_gitignore node,python
# empty arguments output all available options
gen_gitignore ()
{
    list=$(curl -s "https://www.toptal.com/developers/gitignore/api/list")
    str=$1
    parts=("${(@s:,:)str}")
    if [[ -z $parts ]] then
        echo "No arguments provided, the following are valid options: \n"
        echo $list
    else
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
    fi
}
fpath+=($HOME/Dev/pure)
fpath+=$HOME/Dev/typewritten
# .zshrc
autoload -U promptinit; promptinit
prompt typewritten

#nerd alias
alias v="nvim"
alias v3="nvim ~/dotfiles/.config/i3/config"
alias vz="nvim ~/dotfiles/.zshrc"
alias vn="nvim ~/dotfiles/.config/nvim/"

venv(){
    if [[ -d .venv ]]; then
        source .venv/bin/activate
    else
        uv venv
        source .venv/bin/activate
    fi
}
alias genreq="uv pip freeze | uv pip compile - -o requirements.txt"
alias sdi="sudo dpkg -i"
. "$HOME/.cargo/env"
export PATH="${PATH}:${HOME}/Dev/"
export PATH="${PATH}:${HOME}/Dev/lazygit/"
export PATH="$HOME/.tmuxifier/bin:$PATH"
export PATH="${PATH}:${HOME}/.config/scripts/"
export PATH="${PATH}:${HOME}/Dev/texpresso/build/"
export PATH="$PATH:$HOME/Downloads/private/nvim-linux-x86_64/bin"

eval "$(zoxide init zsh)"
eval "$(~/.local/bin/mise activate zsh)"
eval "$(tmuxifier init -)"

. "$HOME/.local/bin/env"

eval "$(/home/frost/.local/bin/mise activate zsh)" # added by https://mise.run/zsh
