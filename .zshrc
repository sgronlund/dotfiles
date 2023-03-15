# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
#ZSH_THEME_RANDOM_CANDIDATES=( "muse" "mgutz" "cloud")

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"
# SHELL =/bin/usr/zsh
# ZSH_TMUX_AUTOSTART = "true"
# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vscode zsh-autosuggestions zsh-syntax-highlighting colored-man-pages)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

function pomo() {
    arg1=$1
    arg2=$2
    cycles=$3

    work=${arg1:?Example: pomo 45 15 }
    split=$((work * 60))
    pause=${arg2:?Example: pomo 45 15}
    break=$((pause * 60))
    wrkmsg="Pomodoro over"
    brkmsg="Break over"
    
    if test -z "$cycles" 
    then
      
      while true; do
          echo "(${work})/(${pause}) Pomodoro started" 
          sleep "${split:?}" && notify-send -u critical -t 0 -a pomo "$wrkmsg"
          sleep "${break:?}" && notify-send -u critical -t 0 -a pomo "$brkmsg"
      done
    else
      
      for ((i=0; i < $cycles; ++i))
      do
          declare -i temp=1
          echo "Cycle $((i + temp)) of $cycles (${work})/(${pause}) Pomodoro started"
          sleep "${split:?}" && notify-send -u critical -t 0 -a pomo "$wrkmsg"
          sleep "${break:?}" && notify-send -u critical -t 0 -a pomo "$brkmsg"
      done
    fi
}


export PATH="${PATH}:${HOME}/.local/bin/"
# export PATH="${PATH}:${HOME}/.cargo/bin/"

# Access windows partition more easily
alias windev="code /media/sgronlu/OS/Users/frost/Desktop/Utveckling/"
alias winuni="code /media/sgronlu/OS/Users/frost/Desktop/Universitetet/"
alias vault="code /media/sgronlu/OS/Users/frost/Desktop/obNotes/"
# Ease updating all the packages
alias up="sudo snap refresh && sudo apt update && sudo apt upgrade && sudo apt autoremove"
alias updot="cp ~/.zshrc ~/Dev/dotfiles/ && cp -r ~/.config/alacritty/ ~/Dev/dotfiles/ && cp -r ~/.config/i3/ ~/Dev/dotfiles/ && cp -r /home/sgronlu/.config/Code/User/sync/ ~/Dev/dotfiles/ && cp -r ~/.config/polybar ~/Dev/dotfiles"

# change brightness
alias light="brightness-controller"

#xrandr for handling monitors, xrandr --listactivemonitors | awk '{print $4}'
alias lapoff="xrandr --output eDP-1 --off && xrandr --output eDP --off"
alias lapon="xrandr --output eDP-1 --auto && xrandr --output eDP --off"
alias laphome="xrandr --output eDP-1 --auto && xrandr --output HDMI-1 --auto --above eDP --auto"

#nerd alis
alias vim="nvim"
# (cat ~/.cache/wal/sequences &)
. "$HOME/.cargo/env"
source /home/sgronlu/Dev/alacritty/extra/completions/alacritty.bash

export PATH="${PATH}:${HOME}/.spicetify"
export PATH="${PATH}:${HOME}/Dev/"

# fix for ssh-agent
eval $(keychain --eval --agents ssh --quick --quiet)


# unnecessary
#xrandr  --output HDMI-A-0 --auto --above eDPexport PATH="$PATH:/opt/mssql-tools/bin"
fpath+=${ZDOTDIR:-~}/.zsh_functions

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
