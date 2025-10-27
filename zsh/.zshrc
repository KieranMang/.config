fzf_tmux() {
  # Get list of sessions, add a "New Session" option
  local session
  session=$( (tmux ls 2>/dev/null; echo "New Session") | fzf --height 40% --layout=reverse --border --prompt="Tmux> " )

  # If user pressed ESC or canceled, exit
  [[ -z "$session" ]] && return

  if [[ "$session" == "New Session" ]]; then
    tmux new
  else
    # Extract session name (before the first ':')
    session_name="${session%%:*}"
    tmux attach -t "$session_name"
  fi
}

if [[ -z "$TMUX" ]] then
  fzf_tmux
fi


fastfetch

[[ -r ~/Repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap
source ~/Repos/znap/znap.zsh

HISTSIZE=5000
HISTFILE=~/.config/zsh/.zsh_history
SAVEHIST=5000
HISTDUP=erase

export BAT_THEME="gruvbox-dark"
export TERM=xterm-256color
export EDITOR="nvim"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

eval "$(zoxide init zsh)"
alias cd='z'
alias cdi='z'


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
alias vim='nvim'
alias ff='cd "$(dirname "$(find ~/Developer -type f | fzf --preview '\''bat --style=numbers --color=always --line-range=:500 {}'\'' --preview-window=right:60%)")"'
alias ffnv='nv "$(find ~/Developer -type f | fzf --preview '\''bat --style=numbers --color=always --line-range=:500 {}'\'' --preview-window=right:60%)"'

type starship_zle-keymap-select >/dev/null || \
  {
    eval "$(starship init zsh)"
  }
bindkey -v
znap source zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#504945,underline"
bindkey '^Y' autosuggest-accept

eval $(thefuck --alias)

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

conda() {
    unset -f conda
    eval "$(/opt/miniconda3/bin/conda shell.zsh hook)"
    command conda "$@"
}

export PATH="/opt/homebrew/bin:/opt/local/bin:/opt/homebrew/opt/qt@5/bin:$PATH"
export CPLUS_INCLUDE_PATH="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/c++/v1:/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include"

# Yazi Config;
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
