################################   Warp Settings   #####################################
source ~/.zshrc

fastfetch

HISTSIZE=5000
HISTFILE=~/.config/zsh/.zsh_history
SAVEHIST=5000
HISTDUP=erase

export BAT_THEME='catppuccin'

setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

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

alias ls='eza'
alias la='eza -la'
alias lstr='eza --tree'

alias reload='source ~/.config/zsh/.zshrc'

alias nv='nvim'
alias ff='cd "$(dirname "$(fzf --preview '\''bat --style=numbers --color=always --line-range=:500 {}'\'' --preview-window=right:60%)")"'
alias ffnv='nv "$(fzf --preview '\''bat --style=numbers --color=always --line-range=:500 {}'\'' --preview-window=right:60%)"'

eval "$(starship init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
