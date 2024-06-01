################################   Settings   #####################################


if [ -z "$TMUX" ]
then
    tmux attach -t TMUX || tmux new -s TMUX
fi


HISTSIZE=5000
HISTFILE=~/.config/zsh/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Case insensitive completion

autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Vim Bindings

bindkey -v

# Aliases

GoParentDirs() {
    local levels=0

  # Count the number of '..' occurrences
    while [[ $1 == '..' ]]; do
        ((levels++))
        shift
    done

  # Perform the 'cd ..' operations
  for ((i = 1; i <= levels; i++)); do
      cd ..
  done

  if [[ $# == 0 ]]; then
      cd ..
  fi
}

alias ..='GoParentDirs'

alias ls='exa'
alias la='exa --all --long'
alias lstr='exa --tree'

alias reload='source ~/.config/zsh/.zshrc'

alias nv='nvim'
alias ff='cd $(find ~/ -type d 2>/dev/null | fzf --height 40%)'
alias ffnv='nv $(find ~/ -type d 2>/dev/null | fzf --height 40%)'


#########################   Powerlevel10K Setup   ##################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.config/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh


#######################   Syntax Highlighting and Auto Suggestions   ############################

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^I' autosuggest-accept
ZSH_AUTOSUGGEST_STRATEGY=completion

source ~/.config/zsh/plugins/catppuccin-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
